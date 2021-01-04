class Donation < ApplicationRecord
  belongs_to :user
  has_one :address

  # validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is invalid"}
end
