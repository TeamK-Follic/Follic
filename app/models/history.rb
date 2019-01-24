class History < ApplicationRecord
  belongs_to :user
  has_many :cart_histories, dependent: :destroy
  accepts_nested_attributes_for :cart_histories, allow_destroy: true

  enum status:{receptionist: 0,preparation: 1,shipped: 2,cancel: 3}

end
