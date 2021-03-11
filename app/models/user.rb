class User < ActiveRecord::Base
    has_many :products
    has_many :locations, through: :products
    has_secure_password
    validates_uniqueness_of :username
    validates :username, presence: true
    validate :username_valid?
    validate :password_valid?

    def slug
        self.username.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        self.all.find {|user| user.slug == slug}
    end

    def username_valid?
        # ^[a-zA-Z0-9]{4,8}$
        word = self.username.match(/^[a-zA-Z0-9]\w{3,7}$/)
        word ? word.to_s == self.username : errors.add(:username, "should include 4 to 8 word characters (letter, number, underscore)")
    end
  
    def password_valid?
        # ^[a-zA-Z0-9]{4,8}$
        passcode = self.password_digest.match(/^[a-zA-Z0-9]{6,10}$/) if self.password_digest
        passcode ? passcode.to_s == self.password : errors.add(:password, "should include 6 to 10 characters of alphabet and/or digits")
    end

end
