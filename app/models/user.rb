class User < ActiveRecord::Base
    has_many :products
    has_many :locations, through: :products
    
    validates_uniqueness_of :username
    has_secure_password ###medium

    def slug
        self.username.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        self.all.find {|user| user.slug == slug}
    end
end
