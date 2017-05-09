FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password              "password"
    password_confirmation "password"

    trait :unconfirmed_access_expired do
      confirmation_token "jkjskfjsakfjk45as45s4dss"
      confirmation_sent_at 9.days.ago
    end

  end
end
