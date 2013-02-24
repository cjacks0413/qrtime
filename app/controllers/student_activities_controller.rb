class StudentActivitiesController < ApplicationController
  before_filter :authenticate_user!
  # GET /student_activities
  # GET /student_activities.json
  def index
    @student_activities = StudentActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_activities }
    end
  end

  # GET /student_activities/1
  # GET /student_activities/1.json
  def show
    @student_activity = StudentActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_activity }
    end
  end

  # GET /student_activities/new
  # GET /student_activities/new.json
  def new
    @student_activity = StudentActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_activity }
    end
  end

  # GET /student_activities/1/edit
  def edit
    @student_activity = StudentActivity.find(params[:id])
  end

  # POST /student_activities
  # POST /student_activities.json
  def check_in
    @student_activity = StudentActivity.new(params[:student_activity])
    @student_activity.user_id = current_user.id
    @student_activity.action = "Check-In"
    @student_activity.date = Date.today
    @student_activity.time = Time.now

    @course_session = CourseSession.find(@student_activity.course_session_id)

    respond_to do |format|
      if @student_activity.save
        format.html { redirect_to @student_activity, notice: 'Student activity was successfully created.' }
        format.json { render json: @student_activity, status: :created, location: @student_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @student_activity.errors, status: :unprocessable_entity }
      end
    end
  end


  def check_out
    @student_activity = StudentActivity.new(params[:student_activity])
    @student_activity.user_id = current_user.id
    @student_activity.action = "Check-Out"
    @student_activity.date = Date.today
    @student_activity.time = Time.now

    respond_to do |format|
      if @student_activity.save
        format.html { redirect_to @student_activity, notice: 'Student activity was successfully created.' }
        format.json { render json: @student_activity, status: :created, location: @student_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @student_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_activities/1
  # PUT /student_activities/1.json
  def update
    @student_activity = StudentActivity.find(params[:id])

    respond_to do |format|
      if @student_activity.update_attributes(params[:student_activity])
        format.html { redirect_to @student_activity, notice: 'Student activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_activities/1
  # DELETE /student_activities/1.json
  def destroy
    @student_activity = StudentActivity.find(params[:id])
    @student_activity.destroy

    respond_to do |format|
      format.html { redirect_to student_activities_url }
      format.json { head :no_content }
    end
  end
end
