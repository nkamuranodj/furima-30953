FactoryBot.define do
  factory :buyer_item do
    user_id           { 2 }
    item_id           { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
    postnumber            { '111-1111' }
    shiparea_id           { 2 }
    deliverymunicipality { 'テスト' }
    deliveryaddres { 'テスト' }
    builname { 'テスト' }
    phonenumber { '09012345678' }
  end
end
