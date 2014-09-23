class Output < ActiveRecord::Base
  enum pin_types: [:digital, :analog]
  enum data_types: [:integer, :float, :string]

  belongs_to :remote_lab
end
