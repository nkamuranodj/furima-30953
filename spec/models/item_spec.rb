require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    describe '商品情報入力' do
      context '出品がうまくいくとき' do
        it '登録内容が存在すれば登録できる' do
          expect(@item).to be_valid
        end
        it '商品名があれば出品できる' do
          @item.item_name = 'テスト'
          expect(@item).to be_valid
        end
        it '商品説明が入力されていれば出品できる' do
          @item.description = 'テスト'
          expect(@item).to be_valid
        end
        it 'カテゴリーに入力があればできる' do
          @item.category_id = '2'
          expect(@item).to be_valid
        end
        it '商品状態が入力あれば登録できる' do
          @item.condition_id = '2'
          expect(@item).to be_valid
        end
        it '価格に入力があれば登録できる' do
          @item.price = '310'
          expect(@item).to be_valid
        end
        it '配送の負担に入力あれば登録できる' do
          @item.delively_payer_id = '2'
          expect(@item).to be_valid
        end
        it '発送先地域に入力あれば登録できる' do
          @item.ship_area_id = '2'
          expect(@item).to be_valid
        end
        it '発送までの日数に入力あれば登録できる' do
          @item.ship_day_id = '2'
          expect(@item).to be_valid
        end
      end
      context '出品がうまくいかないとき' do
        it '画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it '商品説明がないと登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include ("Description can't be blank")
        end
        it '商品のカテゴリーが選択されてないと登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Category must be other than 1'
        end
        it '商品の状態が選択されてないと登録できない' do
          @item.condition_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Condition must be other than 1'
        end
        it '送料の負担が選択されてないと登録できない' do
          @item.delively_payer_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Delively payer must be other than 1'
        end
        it '配送もとの地域が選択されてないと登録できない' do
          @item.ship_area_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Ship area must be other than 1'
        end
        it '発送までの日数が選択されてないと登録できない' do
          @item.ship_day_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Ship day must be other than 1'
        end
        it '価格が入力されていないと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include ("Price can't be blank")
        end
        it '価格が300以下だと登録できない' do
          @item.price = '100'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
        end
        it '価格が9999999円未満でないと登録できない' do
          @item.price = '99999999'
          @item.valid?
          expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
        end
        it '価格が半角数字出ないと登録できない' do
          @item.price = '１'
          @item.valid?
          expect(@item.errors.full_messages).to include ("Price is not a number")
        end
        it '価格が半角数字出ないと登録できない' do
          @item.price = 'a'
          @item.valid?
          expect(@item.errors.full_messages).to include ("Price is not a number")
        end
      end
    end
  end
end
