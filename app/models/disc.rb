class Disc < ApplicationRecord
  belongs_to :item
  has_many :musics, dependent: :destroy
end
