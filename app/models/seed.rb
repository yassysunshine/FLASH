class Seed < ApplicationRecord
  belongs_to :user
  validates :title, presence: true,  length: { in: 1..140 }
  validates :owner, presence: true,  length: { in: 1..140 }
end
