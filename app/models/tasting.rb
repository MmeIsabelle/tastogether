class Tasting < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many :participations, dependent: :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_one :host_participation, -> { where(host: true, status: ["accepted", "finished"]) }, class_name: "Participation"
  has_one :host, through: :host_participation, source: :user
  has_one_attached :photo

  validates :title, :location, presence: true
  validates :title, uniqueness: true, length: { in: 10..75 }
  validates :description, length: { maximum: 500 }
  validates :capacity, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_params,
                  against: %i[title location],
                  associated_against: {
                    host: :username,
                    categories: :name
                  },
                  using: { tsearch: { prefix: true } }

  def date
    Rails.logger.warn("Tasting#date is deprecated, use #start_at instead.")
    start_at
  end

  def date=(value)
    Rails.logger.warn("Tasting#date is deprecated, use #start_at instead.")
    self.start_at = value
  end
end
