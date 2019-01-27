class Disc < ApplicationRecord
  belongs_to :item
  has_many :musics, dependent: :destroy
  accepts_nested_attributes_for :musics, allow_destroy: true

  validates :name, presence: true, length: {maximum: 20}
end
