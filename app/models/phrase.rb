class Phrase < ApplicationRecord
  belongs_to :subcategory
  has_many :connections

  has_many :ads, through: :connections
end
