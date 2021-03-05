class Location < ActiveRecord::Base
    has_many :users, through: :products
end
