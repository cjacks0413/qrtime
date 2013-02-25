class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    @user = current_user
    @courses = @user.courses
  end
end
