FactoryGirl.define do
  factory :user do # :user tells factory girl that the subsequent definition is for a User model object
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end