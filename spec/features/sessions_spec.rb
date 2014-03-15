require 'spec_helper'

describe "Categories", :js => true do

  let!(:user ) { FactoryGirl.create :user }
  describe "sign in" do
    it "should sign a user in" do
      visit sign_in_path
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => user.password
      click_on 'Save Session'
      expect( page ).to have_content user.username
    end
  end

  describe "sign out" do
    it "should sign a user out" do
      visit root_path
      click_on 'Sign Out'
      expect( page ).to_not have_content user.username
    end
  end

end