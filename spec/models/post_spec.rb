require 'spec_helper'

describe Post do
  context "validations" do
    it {should validate_presence_of :body }
  end

  context "associations" do
    it {should belong_to :user}
    it {should belong_to :parent}
    it {should have_many :answers}
  end

end
