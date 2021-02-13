class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one :buyers, dependent: :destroy
  has_one :user, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category, :Condition, :Deliverypayer, :Shiparea, :Shipday
  

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id,  numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :delively_payer_id
    validates :ship_area_id
    validates :ship_day_id


  def was_attached?
    self.image.attached?
  end
end
end


