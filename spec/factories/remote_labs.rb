# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :remote_lab do
    title "My Remote Lab Test"
    version 1.5
    author "Khanh Nguyen"
    school "University of Sydney"
    lab_type RemoteLab.lab_types[:publish_only]
  end
end
