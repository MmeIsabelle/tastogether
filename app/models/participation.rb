class Participation < ApplicationRecord
  belongs_to :tasting
  belongs_to :user
  scope :pending, -> { where(status: "pending") }

end
