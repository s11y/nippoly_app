class Team < ApplicationRecord

  has_many :users

  validates :name, presence: true, length: { maximum: 30 }
end
