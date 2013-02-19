# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student_activity do
    user_id 1
    course_session_id 1
    action "MyString"
    date "2013-02-19"
    time "2013-02-19 14:20:24"
  end
end
