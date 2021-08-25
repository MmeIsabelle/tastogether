class Participation < ApplicationRecord
  belongs_to :tasting
  belongs_to :user
  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  scope :finished, -> { where(status: "finished") }

  validates :status, inclusion: { in: %w[pending accepted finished] }
  validates :initial_message, length: { maximum: 250 }
end
