class Offer < ApplicationRecord
  has_one_attached :photo

  validates :number, :player_name, :team, :photo, :description, :special, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, length: { in: 1..670 }
end
