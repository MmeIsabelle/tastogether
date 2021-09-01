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
  has_many :managed_participations, through: :hosted_tastings, source: :participations

  has_many :notifications

  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
  has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"
  scope :senders_for, ->(user) { joins(:sent_messages).where(messages: { recipient_id: user.id }) }
  scope :receivers_for, ->(user) { joins(:received_messages).where(messages: { sender_id: user.id }) }
  scope :correspondents_for, ->(user) { where(id: senders_for(user)).or(where(id: receivers_for(user))) }

  validates :email, :address, presence: true
  validates :email, :username, uniqueness: true
  validates :bio, length: { maximum: 250 }

  def messages
    Message.where(id: sent_messages).or(Message.where(id: received_messages))
  end

  def correspondents
    User.correspondents_for(self)
  end

  def last_correspondent
    if messages.exists?
      last_message = messages.last
      if last_message.sender == self
        last_message.recipient
      else
        last_message.sender
      end
    end
  end

  def pending_messages_count
    notifications.pending.size
  end

  def pending_requests_count
    managed_participations.pending.size
  end
end
