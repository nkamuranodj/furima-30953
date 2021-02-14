FactoryBot.define do
  factory :item do
    item_name { 'テスト' }
    description        { 'テスト' }
    category_id        { '2' }
    condition_id       { '2' }
    price              { '500' }
    delively_payer_id  { '2' }
    ship_area_id       { '2' }
    ship_day_id        { '2' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
