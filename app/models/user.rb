class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  has_many :participations
  has_many :tastings, through: :participations

  has_many :hosting_participations, -> { where(host: true, status: "accepted") }, class_name: "Participation"
  has_many :hosted_tastings, through: :hosting_participations, source: :tasting

  # has_many :users, through: :messages
  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
  has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"

  validates :email, :address, presence: true
  validates :email, :username, uniqueness: true
  validates :bio, length: { maximum: 250 }

  def messages
    Message.where(id: [sent_messages, received_messages])
  end
end
