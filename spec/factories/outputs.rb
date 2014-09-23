# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :output do
    name "MyString"
    pin_type 1
    pin 1
    data_type 1
    data_parameters "MyString"
    remote_lab_id 1
  end
end
