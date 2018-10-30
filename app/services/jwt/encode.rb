module Jwt
  class Encode
    include Peafowl

    attribute :payload, Hash
    validates :payload, presence: true

    def call
      payload[:iss] = ENV["ISSUER"].to_s
      payload[:iat] = Time.now.to_i
      payload[:exp] = ttl.to_i

      token = JWT.encode(payload, secret_key)
      refresh_token = generate_refresh_token

      context[:token] = token
      context[:refresh_token] = refresh_token
    end

    private
    def secret_key
      Rails.application.secrets.secret_key_base || ENV["JAUTH_SECRET_KEY"]
    end

    def ttl
      time_expiration = ENV["AUTH_TOKEN_TTL"] || 1000
      time_expiration.to_i.minute.from_now
    end

    def refresh_ttl
      refresh_time_expiration = ENV["REFRESH_AUTH_TOKEN_TTL"] || 10000
      refresh_time_expiration.to_i.minute.from_now
    end

    def generate_refresh_token
      Digest::MD5.hexdigest(refresh_ttl.to_s) + SecureRandom.hex
    end
  end
end
