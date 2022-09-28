class Ad < ApplicationRecord
  has_many :connections

  has_many :phrases, through: :connections
end
