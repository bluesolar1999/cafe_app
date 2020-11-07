class ListsController < ApplicationController
  before_action :logged_in_user

  def index
    @lists = current_user.lists
  end

  def create
    @cafe = Cafe.find(params[:cafe_id])
    @user = @cafe.user
    current_user.list(@cafe)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    list = List.find(params[:list_id])
    @cafe = list.cafe
    list.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
