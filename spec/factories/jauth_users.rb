FactoryBot.define do
  factory :jauth_user, class: 'Jauth::User' do
    email { Faker::Internet.email }
    password { "123456aA" }

    factory :valid_jauth_user_register do
       confirm_password { "123456aA" }
    end
  end
end
