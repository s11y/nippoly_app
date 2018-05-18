class User < ApplicationRecord

  belongs_to :team
  has_many :articles
  has_many :comments

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: true }
  has_secure_password
end
