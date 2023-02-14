class Image < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_one_attached :data
end
