class History < ApplicationRecord
  belongs_to :user
  has_many :cart_histories, dependent: :destroy
  accepts_nested_attributes_for :cart_histories, allow_destroy: true

  enum status_id:{receptionist: 0,preparation: 1,shipped: 2,cancel: 3}
  enum payment_id:{no_choice:0 ,credit_card: 1,banking: 2,convenience_store: 3,cash: 4}

end
