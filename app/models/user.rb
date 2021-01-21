class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        has_many :items, dependent:  :destroy
        has_many :comments , dependent: :destroy
        has_many :buyers
        validates :nick_name, presence: true
        validates :first_name, presence: true
        validates :family_name, presence: true
        validates :first_name_kana, presence: true
        validates :family_name_kana, presence: true
        validates :birth_day, presence: true
end
