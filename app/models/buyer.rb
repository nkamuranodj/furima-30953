class Buyer < ApplicationRecord
  belongs_to :item
  belongs_to :user
  with_options presence: true do
    
end
