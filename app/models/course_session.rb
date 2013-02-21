class CourseSession < ActiveRecord::Base
  resourcify
  attr_accessible :course_id, :date, :end_time, :start_time, :description, :check_in_url, :check_out_url

  validates_presence_of :course_id, :date, :end_time, :start_time
  belongs_to :course
  has_many :student_activities
end
