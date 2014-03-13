require 'spec_helper'

FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.word }
    association :parent, factory: :parent_post
    user
  end

  factory :user do
    username { Faker::Lorem.word }
    password "1234"
  end
end
