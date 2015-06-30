class Comment < ActiveRecord::Base
  belongs_to :post
  has_one :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user_id, presence: true
end
