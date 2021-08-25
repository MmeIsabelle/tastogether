class Participation < ApplicationRecord
  belongs_to :tasting
  belongs_to :user
  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  scope :finished, -> { where(status: "finished") }


end
