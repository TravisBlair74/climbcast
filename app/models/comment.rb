class Comment < ApplicationRecord
  belongs_to :area
  belongs_to :user

  validates :body, length: { minimum: 4 }, presence: true
  validates :user, presence: true
end
