class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :course_id 
  has_many :student_activities
  has_many :courses_users
  has_and_belongs_to_many :courses
  belongs_to :role
  accepts_nested_attributes_for :role

  after_create :default_role

  def unenrolled_courses
    Course.all - self.courses
  end

  def enrolled_in?(course)
    self.courses.include?(course)
  end

  private
   def default_role
    self.add_role :student
  end

end
