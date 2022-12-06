class SaveRentalSerializer < ActiveModel::Serializer
  attributes :id, :isSave, :user_id, :rental_id
  belongs_to :user
  belongs_to :rental
end
