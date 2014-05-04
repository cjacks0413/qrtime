class CourseSession < ActiveRecord::Base
  after_save :set_checkin
  resourcify
  attr_accessible :course_id, :date, :end_time, :start_time, :description, :check_in_url, :check_out_url

  validates_presence_of :course_id, :date, :end_time, :start_time
  belongs_to :course
  has_many :student_activities

  def set_checkin 
  	self.check_in_url = "https://tufts.qualtrics.com/SE/?SID=SV_54lHEJAekyaMic5&Speaker=#{self.course.instructor}&Date=#{self.date.strftime("%m-%Y")}&Title=#{self.course.name}"
  end 

end
