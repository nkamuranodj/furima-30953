require 'rails_helper'
RSpec.describe BuyerItem, type: :model do
  before do
    @buyer_item = FactoryBot.build(:buyer_item)
  end
  describe '商品購入機能' do
            describe '商品購入' do
             context '購入がうまくいくとき' do
              it '住所等が存在すれば購入できる' do
                expect(@buyer_item).to be_valid
                  end
                end
                context '購入がうまくいかないとき' do
                  it '郵便番号が空では購入できない' do
                    @buyer_item.postnumber = ''
                    @buyer_item.valid?
                    expect(@buyer_item.errors.full_messages).to include("Postnumber can't be blank")
                  end
                  it '郵便番号がーがなくては購入できない' do
                    @buyer_item.postnumber = '111111111'
                    @buyer_item.valid?
                    expect(@buyer_item.errors.full_messages).to include("Postnumber is invalid. Include hyphen(-)")
                  end
                  it '都道府県が正しく選択されていなくては購入できない' do
                    @buyer_item.shiparea_id = '1'
                    @buyer_item.valid?
                    expect(@buyer_item.errors.full_messages).to include("Shiparea must be other than 1")
                  end
                  it '市区町村が空では購入できない' do
                    @buyer_item.deliverymunicipality = ''
                    @buyer_item.valid?
                    expect(@buyer_item.errors.full_messages).to include("Deliverymunicipality can't be blank")
                  end
                  it '番地が空では購入できない' do
                    @buyer_item.deliveryaddres = ''
                    @buyer_item.valid?
                    expect(@buyer_item.errors.full_messages).to include("Deliveryaddres can't be blank")
                  end
                  it '電話番号が空では購入できない' do
                    @buyer_item.phonenumber = ''
                    @buyer_item.valid?
                    expect(@buyer_item.errors.full_messages).to include("Phonenumber can't be blank")
                  end
                  it '電話番号が番号以外では購入できない' do
                    @buyer_item.phonenumber = 'あ'
                    @buyer_item.valid?
                    expect(@buyer_item.errors.full_messages).to include("Phonenumber is not a number")
                  end
              end
      end
  end
end