class CafesController < ApplicationController
  before_action :logged_in_user

  def new
    @cafe = Cafe.new
  end

  def show
    @cafe = Cafe.find(params[:id])
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

  private

    def cafe_params
      params.require(:cafe).permit(:name, :discription, :order,
                                   :reference, :popularity)
    end
end
