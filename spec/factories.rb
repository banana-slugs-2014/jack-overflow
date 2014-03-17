require 'spec_helper'

FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.word + Faker::Lorem.word + Faker::Lorem.word }
    password "1234"
  end

  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
    type nil
    question_id nil
    user
  end

  factory :question do
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
    type "Question"
    question_id nil
    user
  end

  factory :answer do
    title ""
    body { Faker::Lorem.sentence }
    type "Answer"
    question
    user
  end

  factory :comment do
    sequence :body do |i|
      "test body #{i}"
    end
    user
    post
  end

  factory :vote do
    value 1
    user
    post
  end
end
