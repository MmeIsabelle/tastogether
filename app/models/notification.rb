class Notification < ApplicationRecord
  belongs_to :user

  scope :viewed, -> { where viewed: true }
  scope :pending, -> { where viewed: false }
end
