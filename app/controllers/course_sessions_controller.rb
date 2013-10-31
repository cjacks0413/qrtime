class CourseSessionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /course_sessions
  # GET /course_sessions.json
  def index
 #   authorize! :index, @user, :message => 'Not authorized.'
    @course_sessions = CourseSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_sessions }
    end
  end

  # GET /course_sessions/1
  # GET /course_sessions/1.json
  def show
    Time.zone = 'Eastern Time (US & Canada)'
#    authorize! :show, @user, :message => 'Not authorized.'
    @course_session = CourseSession.find(params[:id])
    @student_activities = StudentActivity.all(:conditions => {:course_session_id => @course_session.id})
    @course = @course_session.course
    @users = @course.users

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_session }
    end
  end

  # GET /course_sessions/new
  # GET /course_sessions/new.json
  def new
 #   authorize! :new, @user, :message => 'Not authorized.'
    @course_session = CourseSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_session }
    end
  end

  # GET /course_sessions/1/edit
  def edit
#    authorize! :edit, @user, :message => 'Not authorized.'
    @course_session = CourseSession.find(params[:id])
  end

  # POST /course_sessions
  # POST /course_sessions.json
  def create
 #   authorize! :create, @user, :message => 'Not authorized.'
    @course_session = CourseSession.new(params[:course_session])

    respond_to do |format|
      if @course_session.save
        format.html { redirect_to @course_session, notice: 'Course session was successfully created.' }
        format.json { render json: @course_session, status: :created, location: @course_session }
      else
        format.html { render action: "new" }
        format.json { render json: @course_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_sessions/1
  # PUT /course_sessions/1.json
  def update
 #   authorize! :update, @user, :message => 'Not authorized.'
    @course_session = CourseSession.find(params[:id])

    respond_to do |format|
      if @course_session.update_attributes(params[:course_session])
        format.html { redirect_to @course_session, notice: 'Course session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_sessions/1
  # DELETE /course_sessions/1.json
  def destroy
 #   authorize! :destroy, @user, :message => 'Not authorized.'
    @course_session = CourseSession.find(params[:id])
    @course_session.destroy

    respond_to do |format|
      format.html { redirect_to course_url(@course_session.course) }
      format.json { head :no_content }
    end
  end

  def check_in
    @course_session = CourseSession.find(params[:course_session_id])
    @user = current_user
    @course = @course_session.course

    @student_activity = StudentActivity.new
    @student_activity.course_session_id = @course_session.id

	
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => course_session_check_in_url(@course_session)}
    end
  end

  def check_out
    @course_session = CourseSession.find(params[:course_session_id])

    @student_activity = StudentActivity.new
    @student_activity.course_session_id = @course_session.id


    respond_to do |format|
      format.html
      format.svg  { render :qrcode => course_session_check_out_url(@course_session) }
    end
  end

end
