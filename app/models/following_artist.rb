class FollowingArtist < ApplicationRecord
  belongs_to :user
  belongs_to :artist
end
