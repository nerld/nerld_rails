class RemoteLab < ActiveRecord::Base
  # enums
  enum lab_type: [:publish_only, :controllable]
  enum pin_types: [:digital, :analog]
  enum data_types: [:integer, :float, :string]

  # Associations
  belongs_to :user
  has_many :inputs
  accepts_nested_attributes_for :inputs, :reject_if => :all_blank, :allow_destroy => true

  # Validations
  validates_presence_of :title, :version, :author, :school, :lab_type
  validates_presence_of :password, :allowable_time, if: "lab_type == 'controllable'"
end
