class CafesController < ApplicationController
  before_action :logged_in_user

  def new
    @cafe = Cafe.new
  end
end
