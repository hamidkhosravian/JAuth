module Jauth
  class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :encrypted_password, length: { minimum: 8 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

    before_save { email.downcase! }

    def self.encrypte_password=(password)
      BCrypt::Password.create(password)
    end

    def valid_password?(password)
      BCrypt::Password.new(self.encrypted_password).eql? password
    end
  end
end
