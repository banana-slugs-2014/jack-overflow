require 'spec_helper'

describe Comment do
  
  describe "associations" do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should allow_mass_assignment_of(:body) }
    it { should allow_value('Test Body').for(:body) }
  end
end