require 'spec_helper'

describe "Favorites", :js => true do

  let!(:user ) { FactoryGirl.create :user }
  describe "Ask a question" do
    it "should let a user log in and Ask Jack" do
      visit new_session_path
      click_on "Sign In"
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => user.password
      click_on 'Save Session'
      click_on 'Ask Jack'
      fill_in 'Title', :with => "Test Post!"
      fill_in 'Body', :with => "This is a question!"
      click_on 'Create Post'
      expect( page ).to have_content "Test Post!"
      click_on "Sign Out"
      visit new_session_path
      click_on "Sign In"
      fill_in 'Username', :with => "Jovanny"
      fill_in 'Password', :with => "admin"
      click_on 'Save Session'

      click_on 'enim'
      click_on 'Mark as Favorite'.first
      expect( page ).to have_content("Marked as Favorite")


    end
  end

  # describe "Ask a question" do
  #   it "should let a user log in and Ask Jack" do
  #     visit new_session_path
  #     click_on "Sign In"
  #     fill_in 'Username', :with => user.username
  #     fill_in 'Password', :with => user.password
  #     click_on 'Save Session'
  #     click_on 'Ask Jack'
  #     fill_in 'Title', :with => "Test Post!"
  #     fill_in 'Body', :with => "This is a question!"
  #     click_on 'Create Post'
  #     expect( page ).to have_content "Test Post!"
    end
  end

  # describe "sign out" do
  #   it "should sign a user out" do
  #     visit users_path
  #     click_on 'Logout'
  #     expect( page ).to have_content "yay"
  #   end
  # end

end