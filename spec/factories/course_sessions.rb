# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_session do
    course_id 1
    date "2013-02-12"
    start_time "2013-02-12 20:03:50"
    end_time "2013-02-12 20:03:50"
  end
end
