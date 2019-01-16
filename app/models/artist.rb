class Artist < ApplicationRecord
  has_many :following_artists, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :items, dependent: :destroy

	attachment :image
end
