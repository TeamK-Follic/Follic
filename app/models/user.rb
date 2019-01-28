class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :histories, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :following_artists, dependent: :destroy


  validates :name, presence: true, length:{maximum: 20}
  validates :name_kana, presence: true
  validates :postal_code, presence: true, length: {is: 7}
  validates :address, presence: true
  validates :phone_number, presence: true, length:{maximum: 11}
end
