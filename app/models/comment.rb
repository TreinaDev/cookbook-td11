class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :recipe
end
