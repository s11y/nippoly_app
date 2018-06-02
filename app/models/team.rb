class Team < ApplicationRecord

  has_many :users

  validates :name, presence: true, length: { maximum: 50 },
            uniqueness: true

  def to_param
    name
  end
end
