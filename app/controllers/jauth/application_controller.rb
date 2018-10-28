module Jauth
  class ApplicationController < ActionController::API
    # protect_from_forgery with: :exception

    rescue_from BadRequestError, with: :bad_request_error

    private
    def bad_request_error(exception)
      render json: { response: exception.message, status: 400 }.to_json, status: 400
    end
  end
end
