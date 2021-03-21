RSpec.describe Shipsdelivery, type: :model do
  describe '商品購入機能' do
    before do
      @shipsdelivery = FactoryBot.build(:shipsdelivery)
      describe '商品購入' do
        context '購入がうまくいくとき' do
          it '住所等が存在すれば購入できる' do
            expect(@shipsdelivery).to be_valid
          end
        end
        context '購入がうまくいかないとき' do
          it '郵便番号が空では購入できない' do
            @shipsdelivery.postnumber = ''
            @shipsdelivery.valid?
            expect(@shipsdelivery.errors.full_messages).to include("Postnumber can't be blank")
          end
          it '都道府県が正しく選択されていなくては購入できない' do
            @shipsdelivery.shiparea_id = '1'
            @shipsdelivery.valid?
            expect(@shipsdelivery.errors.full_messages).to include('Shiparea must be other than 1')
          end
          it '市区町村が空では購入できない' do
            @shipsdelivery.deliverymunicipality = ''
            @shipsdelivery.valid?
            expect(@shipsdelivery.errors.full_messages).to include("Deliverymunicipality can't be blank")
          end
          it '番地が空では購入できない' do
            @shipsdelivery.deliveryaddres = ''
            @shipsdelivery.valid?
            expect(@shipsdelivery.errors.full_messages).to include("Deliveryaddres can't be blank")
          end
          it '電話番号が空では購入できない' do
            @shipsdelivery.phonenumber = ''
            @shipsdelivery.valid?
            expect(@shipsdelivery.errors.full_messages).to include("Phonenumber can't be blank")
          end
          it '電話番号が番号以外では購入できない' do
            @shipsdelivery.phonenumber = 'あ'
            @shipsdelivery.valid?
            expect(@shipsdelivery.errors.full_messages).to include('Phonenumber is not a number')
          end
        end
      end
    end
  end
end
