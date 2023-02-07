class Convo < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :messages, dependent: :destroy
  validates :post, presence: true
  validates :user, presence: true
end
