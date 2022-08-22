class Transaction < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  belongs_to :seller_card
  belongs_to :buyer_card
end
