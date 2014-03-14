require 'spec_helper'

describe "Categories", :js => true do

  let!(:user ) { FactoryGirl.create :user }
  describe "sign in" do
    it "should sign a user in" do
      visit '/sessions/new'
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => user.password
      click_on 'Save Session'
      expect( page ).to have_content "User Hello"
    end
  end
end