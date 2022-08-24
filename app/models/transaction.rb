class Transaction < ApplicationRecord
  belongs_to :buyer, foreign_key: 'buyer_id', class_name: 'User'
  belongs_to :seller, foreign_key: 'seller_id', class_name: 'User'
  belongs_to :seller_card, foreign_key: 'seller_card_id', class_name: 'Offer'
  belongs_to :buyer_card, foreign_key: 'buyer_card_id', class_name: 'Offer'

  validates :seller_card, uniqueness: { scope: :buyer_card }
end
