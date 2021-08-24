class Tasting < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_one_attached :photo
end
