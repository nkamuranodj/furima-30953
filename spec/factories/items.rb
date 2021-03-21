FactoryBot.define do
  factory :item do
    item_name { 'テスト' }
    description        { 'テスト' }
    category_id        { 2 }
    condition_id       { 2 }
    price              { 500 }
    deliverypayer_id  { 2 }
    shiparea_id       { 2 }
    shipday_id        { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
