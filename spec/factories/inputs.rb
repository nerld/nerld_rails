# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :input do
    name "MyString"
    pin_type 1
    pin 1
    data_type 1
    data_rate 1.5
    data_units "MyString"
  end
end
