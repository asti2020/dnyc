class SaveRental < ApplicationRecord
  belongs_to :user
  belongs_to :rental
  validates :user_id, uniqueness: { scope: :rental_id }
end