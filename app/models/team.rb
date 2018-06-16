class Team < ApplicationRecord

  has_many :users
  has_many :articles, through: :users, source: :articles

  validates :name, presence: true, length: { maximum: 50 },
            uniqueness: true

  def to_param
    name
  end
end
