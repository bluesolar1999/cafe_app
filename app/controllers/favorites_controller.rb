class FavoritesController < ApplicationController
  before_action :logged_in_user

  def index
    @favorites = current_user.favorites
  end

  def create
    @cafe = Cafe.find(params[:cafe_id])
    @user = @cafe.user
    current_user.favorite(@cafe)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
    if @user != current_user
      @user.notifications.create(cafe_id: @cafe.id, variety: 1,
                                 from_user_id: current_user.id)
      @user.update_attribute(:notification, true)
    end
  end

  def destroy
    @cafe = Cafe.find(params[:cafe_id])
    current_user.favorites.find_by(cafe_id: @cafe.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
