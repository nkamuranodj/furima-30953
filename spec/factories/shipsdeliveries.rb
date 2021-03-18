FactoryBot.define do
  factory :shipsdelivery do
    postnumber            { '111-1111' }
    shiparea_id           { 1 }
    deliverymunicipality { 'テスト' }
    deliveryaddres { 'テスト' }
    builname { 'テスト' }
    phonenumber { '09012345678' }
  end
end
