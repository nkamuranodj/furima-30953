require 'rails_helper'
RSpec.describe User, type: :model do
  describe "会員情報入力" do
    it "nicknameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.nick_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end
    it "first nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include "First name can't be blank"
    end
    it "first nameが全角(漢字・平仮名・カタカナ)以外では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = "abc"
      user.valid?
      expect(user.errors.full_messages).to include "First name is invalid"
    end
    it "first name kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "first name kanaが全角(漢字・平仮名・カタカナ)以外では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = "abc"
      user.valid?
      expect(user.errors.full_messages).to include "First name kana is invalid"
    end
    it "family nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = ""
      user.valid?
      expect(user.errors.full_messages).to include "Family name can't be blank"
    end
    it "family nameが全角(漢字・平仮名・カタカナ)以外では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = "abc"
      user.valid?
      expect(user.errors.full_messages).to include "Family name is invalid"
    end
    it "family name kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it "family name kanaが全角(漢字・平仮名・カタカナ)以外では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = "abc"
      user.valid?
      expect(user.errors.full_messages).to include "Family name kana is invalid"
    end
    it "birth dayが空では登録できない" do
      user = FactoryBot.build(:user)
      user.birth_day = ""
      user.valid?
      expect(user.errors.full_messages).to include "Birth day can't be blank"
    end
  end
end