class BuyerItem
  include ActiveModel::Model
  attr_accessor :postnumber, :shiparea_id, :deliverymunicipality, :deliveryaddres, :builname, :phonenumber, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postnumber, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shiparea_id, numericality: { other_than: 1 }
    validates :deliverymunicipality
    validates :deliveryaddres
    validates :phonenumber, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Shipsdelivery.create(postnumber: postnumber, shiparea_id: shiparea_id, deliverymunicipality: deliverymunicipality,
                         deliveryaddres: deliveryaddres, builname: builname, phonenumber: phonenumber, buyer_id: buyer.id)
  end
end
