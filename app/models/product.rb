class Product < ActiveRecord::Base
    belongs_to :user
    belongs_to :location
    validates :name, presence: true
end
