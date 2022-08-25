class Offer < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :transactions, foreign_key: :buyer_card, foreign_key: :seller_card, dependent: :delete_all

  scope :available, -> { where("available = ?", true) }

  validates :number, :player_name, :team, :photo, :description, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, length: { in: 1..670 }

  def trade!
    self.update_attribute("available", false)
  end
end
