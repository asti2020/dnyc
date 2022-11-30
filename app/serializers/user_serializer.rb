class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :email
  has_many :rentals


#   def avatar
#     if object.avatar.attached?
#       {
#         url: rails_blob_url(object.avatar)
#       }
#     end

#   end
# end
  # def avatar
  #   if object.avatar.attached?
  #     {
  #       url: rails_blob_url(object.avatar)
  #     }
  #   end
  end

