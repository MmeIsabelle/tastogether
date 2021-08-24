class Category < ApplicationRecord
  has_many :categorizations
  has_many :tastings, through: :categorizations
end
