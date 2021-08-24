class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :tastings, through: :participations

  has_many :hosting_participations, -> { where(host: true, status: "accepted") }, class_name: "Participation"
  has_many :hosted_tastings, through: :hosting_participations, source: :tasting
end
