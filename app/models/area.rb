class Area < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, length: { minimum: 3 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true
end
