require 'rails_helper'

module Jauth
  RSpec.describe AuthenticationsController, type: :controller do
    routes { Jauth::Engine.routes }

    describe "when user sign up" do
      it "with valid data" do
        post :sign_up, params: FactoryBot.attributes_for(:valid_jauth_user_register)
        expect(response).to have_http_status(201)
      end

      context "when invalid data" do
        it "with invalid password length" do
          post :sign_up, params: FactoryBot.attributes_for(:valid_jauth_user_register, password: '123')
          res = JSON.parse(response.body)
          expect(response).to have_http_status(400)
          expect(res["response"]).to include(I18n.t("user.sign_up.errors.password_length"))
        end

        it "without confirm_passowrd" do
          post :sign_up, params: FactoryBot.attributes_for(:jauth_user)
          res = JSON.parse(response.body)
          expect(response).to have_http_status(400)
          expect(res["response"]).to include("Confirm password can't be blank")
        end

        it "with not equal password and confirm_passowrd" do
          post :sign_up, params: FactoryBot.attributes_for(:valid_jauth_user_register, confirm_password: '123456aa')
          res = JSON.parse(response.body)
          expect(response).to have_http_status(400)
          expect(res["response"]).to include(I18n.t("user.sign_up.errors.confirm_password"))
        end
      end
    end

    describe "when user sign in" do
      let!(:user_attributes) { FactoryBot.attributes_for(:jauth_user) }

      it "with valid data" do
        post :sign_up, params: FactoryBot.attributes_for(:valid_jauth_user_register)
        expect(response).to have_http_status(201)

        post :sign_in, params: user_attributes, format: 'json'
        res = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(res["email"]).to eq(user_attributes[:email])
      end
    end
  end
end
