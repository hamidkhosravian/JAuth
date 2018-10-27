FactoryBot.define do
  factory :jauth_auth_token, class: 'Jauth::AuthToken' do
    token { "MyString" }
    refresh_token { "" }
    user { nil }
  end
end
