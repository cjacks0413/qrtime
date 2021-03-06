class CoursesController < ApplicationController
  before_filter :authenticate_user!
  # GET /courses
  # GET /courses.json
  def index
  #  authorize! :index, @user, :message => 'Not authorized.'
    @courses = Course.all
    @course_sessions = CourseSession.all
    @caldate = params[:month] ? Date.parse(params[:month]) : Date.today

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    Time.zone = 'Eastern Time (US & Canada)'
   # authorize! :index, @user, :message => 'Not authorized.'
    @course = Course.find(params[:id])
    @course_sessions = @course.course_sessions
    @users = @course.users

    @all_users = User.with_role :student
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
      format.csv # show.cvs.erb
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    #authorize! :new, @user, :message => 'Not authorized.'
    @course = Course.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    #authorize! :edit, @user, :message => 'Not authorized.'
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    #authorize! :create, @user, :message => 'Not authorized.'
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    #authorize! :update, @user, :message => 'Not authorized.'
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
   #authorize! :destroy, @user, :message => 'Not authorized.'
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  
end

# # GET /courses/1/roll
# def roll
#   @course = Course.find(params[:id])
# end