FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "user#{n}" }
    password_digest "password"
  end

  factory :article do
    sequence(:title)  { |n| "article#{n}" }
    text "article text"
  end


end

