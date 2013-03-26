class StudentActivity < ActiveRecord::Base
  attr_accessible :action, :course_session_id, :date, :time, :user_id, :excuse


  belongs_to :user
  belongs_to :course_session
end
