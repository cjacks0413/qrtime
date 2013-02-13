class CourseSession < ActiveRecord::Base
  attr_accessible :course_id, :date, :end_time, :start_time

  validates_presence_of :course_id, :date, :end_time, :start_time
  belongs_to :course
end
