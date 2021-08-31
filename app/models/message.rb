class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  validates :content, presence: true
  
  scope :between, -> (user1, user2) do 
    where("(messages.sender_id = ? AND   messages.recipient_id =?) OR (messages.sender_id = ? AND messages.recipient_id =?)", user1, user2, user2, user1)
  end
end
