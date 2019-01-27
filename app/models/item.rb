class Item < ApplicationRecord

  belongs_to :artist
  belongs_to :type
  belongs_to :genre
  belongs_to :label

  has_many :cart_histories, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :discs, dependent: :destroy

	attachment :image

  accepts_nested_attributes_for :discs, allow_destroy: true

  validates :title, presence: true, length: {maximum: 40}
  validates :price, presence: true, length: {maximum: 7}
  validates :stock, presence: true, length: {maximum: 7}

  validates :artist_id, presence: true
  validates :type_id, presence: true
  validates :genre_id, presence: true
  validates :label_id, presence: true

end
