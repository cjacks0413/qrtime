class Course < ActiveRecord::Base
  resourcify
  attr_accessible :name, :instructor

  validates_presence_of :name, :instructor

  has_many :course_sessions
  has_many :users
end
