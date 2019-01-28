class Event < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true, length: {maximum: 30}
  validates :detail, presence: true, length: {maximum: 200}
  validates :datetime, presence: true
end
