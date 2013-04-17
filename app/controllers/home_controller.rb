class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    Time.zone = 'Eastern Time (US & Canada)'
    @users = User.all
    @user = current_user
    if current_user.has_role?(:instructor) == true
       @courses = Course.all(:conditions => {:instructor => current_user.id})
       @course_sessions = CourseSession.all(:conditions => {:course_id => @courses})
    elsif current_user.has_role?(:student) == true
      @courses = @user.courses
    end

    @student_activities = StudentActivity.find_all_by_user_id(@user)
    @caldate = params[:month] ? Date.parse(params[:month]) : Date.today
  end
end
