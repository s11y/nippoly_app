class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
end
