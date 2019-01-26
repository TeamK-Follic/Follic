class History < ApplicationRecord
  belongs_to :user
  has_many :cart_histories, dependent: :destroy
  accepts_nested_attributes_for :cart_histories, allow_destroy: true

  enum status_id:{receptionist: 0,preparation: 1,shipped: 2,cancel: 3}
  # enum payment_id:{credit_card: 0,banking: 1,store: 2,cash: 3}

end
