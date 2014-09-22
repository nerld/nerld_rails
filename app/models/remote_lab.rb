class RemoteLab < ActiveRecord::Base
  # Types
  enum lab_type: [:publish_only, :controllable]

  # Associations
  belongs_to :user

  # Validations
  validates_presence_of :title, :version, :author, :school, :lab_type
  validates_presence_of :password, :allowable_time, if: "lab_type == 'controllable'"
end
