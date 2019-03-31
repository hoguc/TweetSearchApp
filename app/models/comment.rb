class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :like
  validates :content, presence: true
end
