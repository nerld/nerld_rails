class RemoteLab < ActiveRecord::Base
  # enums
  enum lab_type: [:publish_only, :controllable]

  # Associations
  belongs_to :user
  has_many :inputs
  has_many :outputs
  accepts_nested_attributes_for :inputs, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :outputs, :reject_if => :all_blank, :allow_destroy => true

  # Validations
  validates_presence_of :title, :version, :author, :school, :lab_type
  validates_presence_of :password, :allowable_time, if: "lab_type == 'controllable'"
end
