class Ad < ApplicationRecord
  has_many :phrases, through: :connections
end
