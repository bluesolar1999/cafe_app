class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @cafe = Cafe.find(params[:cafe_id])
    @user = @cafe.user
    @comment = @cafe.comments.build(user_id: current_user.id, content: params[:comment][:content])
    if !@cafe.nil? && @comment.save
      flash[:success] = "コメントを追加しました！"
      if @user != current_user
        @user.notifications.create(cafe_id: @cafe.id, variety: 2,
                                   from_user_id: current_user.id,
                                   content: @comment.content) # コメントは通知種別2
        @user.update_attribute(:notification, true)
      end
    else
      flash[:danger] = "空のコメントは投稿できません。"
    end
    redirect_to request.referrer || root_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @cafe = @comment.cafe
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:success] = "コメントを削除しました"
    end
    redirect_to cafe_url(@cafe)
  end
end
