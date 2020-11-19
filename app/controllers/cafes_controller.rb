class CafesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]

  def new
    @cafe = Cafe.new
  end

  def show
    @cafe = Cafe.find(params[:id])
    @comment = Comment.new
  end

  def create
    @cafe = current_user.cafes.build(cafe_params)
    if @cafe.save
      flash[:success] = "カフェが登録されました！"
      redirect_to cafe_path(@cafe)
    else
      render 'cafes/new'
    end
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  def update
    @cafe = Cafe.find(params[:id])
    if @cafe.update_attributes(cafe_params)
      flash[:success] = "カフェ情報が更新されました！"
      redirect_to @cafe
    else
      render 'edit'
    end
  end

  def destroy
    @cafe = Cafe.find(params[:id])
    if current_user.admin? || current_user?(@cafe.user)
      @cafe.destroy
      flash[:success] = "投稿が削除されました"
      redirect_to request.referrer == user_url(@cafe.user) ? user_url(@cafe.user) : root_url
    else
      flash[:danger] = "他人の投稿は削除できません"
      redirect_to root_url
    end
  end

  def cafe_params
    params.require(:cafe).permit(:name, :description, :order,
                                 :reference, :popularity, :picture)
  end

  private

    def cafe_params
      params.require(:cafe).permit(:name, :discription, :order,
                                   :reference, :popularity)
    end

    def correct_user
      # 現在のユーザーが更新対象の料理を保有しているかどうか確認
      @cafe = current_user.cafes.find_by(id: params[:id])
      redirect_to root_url if @cafe.nil?
    end
end
