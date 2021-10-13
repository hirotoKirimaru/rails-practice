class User < ApplicationRecord
    # before_save { email.downcase! }
    # before_save { self.email = email.downcase }
    attr_accessor :name, :email
    validates :name, presence: true, length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 } , format: { with: VALID_EMAIL_REGEX }
    # , uniqueness: true


    def initialize(attributes = {})
      @name  = attributes[:name]
      @email = attributes[:email]
    end
  
    def formatted_email
      "#{@name} <#{@email}>"
    end
    has_secure_password
  end