class CartHistory < ApplicationRecord
  belongs_to :history
  belongs_to :item
end
