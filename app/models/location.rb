class Location < ActiveRecord::Base
    has_many :products
    has_many :users, through: :products
end
