# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    subject "MyString"
    content "MyText"
    read false
  end
end
