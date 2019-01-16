class History < ApplicationRecord
  belongs_to :user
  has_many :cart_histories, dependent: :destroy
end
