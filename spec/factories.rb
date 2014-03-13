require 'spec_helper'

FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.word }
    password "1234"
  end

  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.word }
    parent_id nil
    user
  end

  factory :comment do
    sequence :body do |i|
      "test body #{i}"
    end
    user
    post
  end
end
