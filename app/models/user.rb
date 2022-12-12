class User < ApplicationRecord
    has_secure_password
    has_many :rentals, dependent: :destroy
    has_many :bookings, dependent: :destroy
    has_many :save_rentals

    validates :first_name, presence: true
    validates :email, presence: true
    validates :password, presence: true
end

# User.connetction.avatar.attach io: File.open('app/assets/images/placeholder.png'), filename: 'placeholder.png', content_type: 'image/png', identify: false

# user.avatar.attached? # => true

# user.avatar.purge_later # => true

# user.avatar.attached? # => false

# url_for(user.avatar)