require 'spec_helper'

describe "Favorites", :js => true do

  let!(:user ) { FactoryGirl.create :user }
  describe "sign in" do
    it "should sign a user in" do
      visit new_session_path
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => user.password
      click_on 'Save Session'
      expect( page ).to have_content "yay"
    end
  end

  describe "sign out" do
    it "should sign a user out" do
      visit users_path
      click_on 'Logout'
      expect( page ).to have_content "yay"
    end
  end

end