 require 'spec_helper'

describe Post do
  context "validations" do
    it {should validate_presence_of :body }
  end

  context "associations" do
    it {should belong_to :user}
    it {should have_many :votes}
  end
end

describe Question do
  context "validations" do
    it {should validate_presence_of :title}
  end

  context "associations" do
    it {should have_many :answers}
  end
end

describe Answer do
  context "associations" do
    it {should belong_to :question}
  end
end