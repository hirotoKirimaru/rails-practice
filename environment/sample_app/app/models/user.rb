class User < ApplicationRecord
    attr_accessor :name, :email
    validates :name, presence: true

    def initialize(attributes = {})
      @name  = attributes[:name]
      @email = attributes[:email]
    end
  
    def formatted_email
      "#{@name} <#{@email}>"
    end
  end