class Purchase < ApplicationRecord
  has_one :user_address
  belongs_to :user
  # with_options presence: true do
  #   validates :price
  # end
end
