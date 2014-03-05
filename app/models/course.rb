class Course < ActiveRecord::Base
  resourcify
  attr_accessible :name, :instructor

  validates_presence_of :name, :instructor

  has_many :course_sessions
  has_many :courses_users
  has_and_belongs_to_many :users


  def valid_sessions
  	course.course_session.where("date < ?", Time.now.beginning_of_day)
  end 

end
