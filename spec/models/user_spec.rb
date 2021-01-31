require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '会員情報入力' do
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "登録内容が存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it "ニックネームがあれば登録できる" do
          @user.nick_name = "テスたろう"
          expect(@user).to be_valid
        end
        it "メールアドレス@があり正しければ登録できる" do
          @user.email = "test@aaa"
          expect(@user).to be_valid
        end
        it "passwordが6文字以上で半角英数混合であれば登録できる" do
          @user.password = "test123"
          @user.password_confirmation = "test123"
          expect(@user).to be_valid
        end
        it "first_nameが全角（漢字・平仮名・カタカナ）だと登録できる" do
          @user.first_name = "テスト"
          expect(@user).to be_valid
        end
        it "first_name_kanaの振りカナが全角（カタカナ）だと登録できる" do
          @user.first_name_kana = "テスト"
          expect(@user).to be_valid
        end
        it "family_nameが全角（漢字・平仮名・カタカナ）だと登録できる" do
          @user.family_name = "テスト"
          expect(@user).to be_valid
        end
        it "family_name_kanaの振りカナが全角（カタカナ）だと登録できる" do
          @user.family_name = "テスト"
          expect(@user).to be_valid
        end
        it "birth_dayが入力されていれば登録できる" do
          @user.birth_day = "1983/10/10"
          expect(@user).to be_valid
        end
      end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
     end
    it 'emailが@無しでは登録できない' do
      @user.email = 'aaa.aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "重複したemailが存在する場合登録できない" do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが一致しなければ登録できない' do
      @user.password = 'b123123'
      @user.password_confirmation = 'a123123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが数字のみ登録できない' do
      @user.password = '123123'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'passwordが全角では登録できない' do
      @user.password = 'a１２３４５６'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'passwordが６文字以上でなければ登録できない' do
      user = FactoryBot.build(:user)
      user.password = '12312'
      user.valid?
      expect(user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'first nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first nameが全角(漢字・平仮名・カタカナ)以外では登録できない' do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'first name kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first name kanaが全角(カタカナ)以外では登録できない' do
      @user.first_name_kana = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'family nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'family nameが全角(漢字・平仮名・カタカナ)以外では登録できない' do
      @user.family_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name is invalid'
    end
    it 'family name kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'family name kanaが全角(カタカナ)以外では登録できない' do
      @user.family_name_kana = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana is invalid'
    end
    it 'birth dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
  end
end
end
end
