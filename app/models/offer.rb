class Offer < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :transactions, foreign_key: :buyer_card, foreign_key: :seller_card, dependent: :delete_all

  validates :number, :player_name, :team, :photo, :description, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, length: { in: 1..670 }

  include PgSearch::Model
  pg_search_scope :search_offers,
                  against: %i[number player_name team description],
                  using: { tsearch: { any_word: true } }
end
