module Jwt
  class Generate
    include Peafowl

    attribute :user, ::Jauth::User
    validates :user, presence: true

    def call
      payload = { user_id: user.id, iat: Time.now.to_i}

      token_encode = Jwt::Encode.call(payload: payload)
      add_error!(token_encode.errors) if token_encode.failure?
      token = token_encode.refresh_token
      refresh_token = token_encode.refresh_token

      auth_token = ::Jauth::AuthToken.new
      auth_token.user_id = user.id
      auth_token.token = token
      auth_token.refresh_token = refresh_token
      auth_token.save!

      context[:auth_token] = auth_token
    end
  end
end
