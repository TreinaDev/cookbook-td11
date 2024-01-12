class Comment < ApplicationRecord
  has_one_attached :image
  validates :text, presence: true
  belongs_to :recipe
end
