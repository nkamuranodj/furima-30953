class Item < ApplicationRecord
  #has_many :comments, dependent: :destroy
  #has_one :buyers, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :deliverypayer
  belongs_to_active_hash :shiparea
  belongs_to_active_hash :shipday

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :condition_id
      validates :category_id
      validates :deliverypayer_id
      validates :shiparea_id
      validates :shipday_id
    end
  end
end
