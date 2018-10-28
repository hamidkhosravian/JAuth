FactoryBot.define do
  factory :jauth_user, class: 'Jauth::User' do
    email { Faker::Internet.email }
    encrypted_password { "MyString" }
  end
end
