class RemoteLab < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates_presence_of :title, :version, :author, :school
end
