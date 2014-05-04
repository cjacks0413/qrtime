class Course < ActiveRecord::Base
  after_initialize :set_defaults
  resourcify
  attr_accessible :name, :instructor

  validates_presence_of :name, :instructor

  has_many :course_sessions
  has_many :courses_users
  has_and_belongs_to_many :users
  attr_accessible :user_ids

  def valid_sessions
  	self.course_sessions.where("date < ?", Time.now.beginning_of_day)
  end 

  private
  
    def set_defaults 
      self.check_in_url = "https://docs.google.com/forms/d/1GmR3t7xz8ce4gdUIQpFgDwKMWuW8ZmHkASq6xXh_ID8/viewform"
    end  

end
