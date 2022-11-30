class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :rentals, dependent: :destroy
end

User.connetction.avatar.attach io: File.open('app/assets/images/placeholder.png'), filename: 'placeholder.png', content_type: 'image/png', identify: false

user.avatar.attached? # => true

user.avatar.purge_later # => true

user.avatar.attached? # => false

url_for(user.avatar)