class Artist < ApplicationRecord
  has_many :following_artists, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :items, dependent: :destroy

	attachment :image

  validates :name, presence: true, length: {maximum: 20}
  validates :name_kana, presence: true, length: {maximum: 30}
  validates :intro, presence: true, length: {maximum: 200}

  def followed_by?(user)
    following_artists.where(user_id: user.id).exists?
  end

  class Artits < ActiveRecord::Base
    paginates_per 5
  end

end
