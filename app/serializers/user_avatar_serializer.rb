class UserAvatarSerializer < ActiveModel::Serializer
  attributes :id, :avatar
  has_one_attached :avatar

  def avatar
    if object.avatar.attached?
      {
        url: rails_blob_url(object.avatar)
      }
    end
  end
end
