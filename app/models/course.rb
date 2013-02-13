class Course < ActiveRecord::Base
  attr_accessible :name, :instructor

  validates_presence_of :name, :instructor

  has_many :course_sessions
end
