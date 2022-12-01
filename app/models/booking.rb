class Booking < ApplicationRecord
  belongs_to :meeting, optional: true
  belongs_to :user
  belongs_to :rental

end
