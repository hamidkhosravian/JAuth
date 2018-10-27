FactoryBot.define do
  factory :jauth_user, class: 'Jauth::User' do
    email { "MyString" }
    encrypted_password { "MyString" }
  end
end
