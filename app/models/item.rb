class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :type
  belongs_to :genre
  belongs_to :label

  has_many :cart_histories, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :discs, dependent: :destroy

	attachment :image
end
