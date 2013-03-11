class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    @user = current_user
    @courses = @user.courses
    @student_activities = StudentActivity.find_all_by_user_id(@user)
  end
end
