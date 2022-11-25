class User < ApplicationRecord
    has_secure_password
    has_many :rentals, dependent: :destroy
end
