require 'rails_helper'

module Jauth
  RSpec.describe AuthenticationsController, type: :controller do
    routes { Rails.application.routes }

    context "when user sign up" do
      it "with valid data" do
        post 'sign_up', params: FactoryBot.attributes_for(:jauth_user)
        expect(response).to have_http_status(201)
      end
    end
  end
end
