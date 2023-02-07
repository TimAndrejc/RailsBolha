class Message < ApplicationRecord
  belongs_to :convo
  belongs_to :user
  validates :message, presence: true
  validates :user, presence: true
end
