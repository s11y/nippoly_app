class User < ApplicationRecord

  belongs_to :team
  has_many :articles

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :password_digest, presence: true
end
