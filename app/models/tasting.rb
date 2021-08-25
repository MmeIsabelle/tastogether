class Tasting < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_one :host_participation, -> { where(host: true, status: "accepted") }, class_name: "Participation"
  has_one :host, through: :host_participation, source: :user
  has_one_attached :photo

  validates :title, :location, :date, presence: true
  validates :title, uniqueness: true, length: { in: 10..75 }
  validates :description, length: { maximum: 500 }
  validates :capacity, numericality: { only_integer: true }
end
