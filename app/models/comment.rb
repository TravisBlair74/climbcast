class Comment < ApplicationRecord
  belongs_to :area
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true

  def user_handle
    user.username || 'Anonymous'
  end

end
