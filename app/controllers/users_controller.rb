class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    Time.zone = 'Eastern Time (US & Canada)'
    @user = User.find(params[:id])
    @courses = @user.courses

    respond_to do |format|
      format.html # show.html.erb
      format.csv # show.cvs.erb
    end
  end
    
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end


  # GET /users/1/courses
  def courses
    @user = User.find(params[:id])
    @courses = @user.courses
  end


  # POST /users/1/course_add?course_id=2
  # (note no real query string, just
  # convenient notation for parameters)
  def course_add
    #Convert ids from routing to objects
    @user = User.find(params[:id])
    @course = Course.find(params[:course])
    if not @user.enrolled_in?(@course)
      #add course to list using << operator
      @user.courses << @course
      flash[:notice] = 'Student was successfully enrolled'
    else
      flash[:error] = 'Student was already enrolled'
    end
    redirect_to root_path

  end

  # POST /users/1/course_remove?courses[]=
  def course_remove
    #Convert ids from routing to object
    @user = User.find(params[:id])
    #get list of courses to remove from query string
    course_ids = params[:courses]
    unless course_ids.blank?
      course_ids.each do |course_id|
        course = Course.find(course_id)
        if @user.enrolled_in?(course)
          logger.info "Removing student from course #{course.id}"
          @user.courses.delete(course)
          flash[:notice] = 'Course was successfully deleted'
        end
      end
    end
    redirect_to root_path
  end

end