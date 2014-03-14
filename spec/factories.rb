require 'spec_helper'

FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.word }
    password "1234"
  end

  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.word }
    parent_id 0
    user
  end
end
