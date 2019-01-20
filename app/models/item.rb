class Item < ApplicationRecord

  enum genre_id: [:jpop, :kpop, :yougaku, :HARDCORE]

  belongs_to :artist
  belongs_to :type
  belongs_to :genre
  belongs_to :label

  has_many :cart_histories, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :discs, dependent: :destroy

	attachment :image

  accepts_nested_attributes_for :discs, allow_destroy: true
end
