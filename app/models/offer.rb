class Offer < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  #has_many :transactions, foreign_key: %i[buyer_card seller_card], dependent: :destroy

  scope :available, -> { where("available = ?", true) }

  validates :number, :player_name, :team, :photo, :description, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, length: { in: 1..670 }

  def trade!
    self.update_attribute("available", false)
  end

  include PgSearch::Model
  pg_search_scope :search_offers,
                  against: %i[number player_name team description],
                  using: { tsearch: { prefix: true } }
end
