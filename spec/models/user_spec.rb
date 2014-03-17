require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :password_digest }
  end

  context "associations" do
    it {should have_many :votes}
  end
end