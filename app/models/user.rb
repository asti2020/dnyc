class User < ActionController::API
    extend Devise::Models
    # has_secure_password

    # has_many :orders
    # has_many :products, through: :orders
    # validates :first_name, :last_name, :email, :password, presence: true
    # validates :email, uniqueness: true
    # validates :password, length: {minimum: 6}
end