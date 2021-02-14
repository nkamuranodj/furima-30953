class Item < ApplicationRecord
  #has_many :comments, dependent: :destroy
  #has_one :buyers, dependent: :destroy
  has_one :user, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deliverypayer
  belongs_to :shiparea
  belongs_to :shipday

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :condition_id
      validates :category_id
      validates :delively_payer_id
      validates :ship_area_id
      validates :ship_day_id
    end
  end
end
