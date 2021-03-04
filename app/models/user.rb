class User < ActiveRecord::Base
    has_many :products
    has_many :locations, through: :products

    has_secure_password
end
