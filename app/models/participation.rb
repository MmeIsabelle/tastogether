class Participation < ApplicationRecord
  belongs_to :tasting
  belongs_to :user
  scope :pending, -> { where(status: "pending", host: false) }
  scope :accepted, -> { where(status: "accepted", host: false) }
  scope :finished, -> { where(status: "finished", host: false) }


end
