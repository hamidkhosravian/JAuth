module Authentications
  class SignUp
    include Peafowl

    attribute :email, String
    attribute :password, String

    validates :email, presence: true
    validates :password, presence: true

    def call
      encrypted_password = User.encrypte_password(password)
      user = User.create!(email: email, encrypted_password: encrypted_password)
      context[:user] = user
    end
  end
end
