class Buyer < ApplicationRecord

  has_one :shipsdelivery
  belongs_to :item
  belongs_to :user
  

end
