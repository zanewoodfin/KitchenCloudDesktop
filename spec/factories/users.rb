FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :username do |n|
    "username#{n}"
  end

  factory :user do
    email
    username
    password "password"
    password_confirmation "password"
    first_name "John"
    last_name "Smith"
  end
end
