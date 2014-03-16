require 'spec_helper'

describe "Voting", :js => true do
  let!(:myuser) { FactoryGirl.create :user }
  let!(:mypost) { FactoryGirl.create :post }
  describe "Upvote" do
    it "should show changed vote count upon click" do
      visit new_session_path
      click_on "Sign In"
      fill_in 'Username', :with => myuser.username
      fill_in 'Password', :with => myuser.password
      click_on 'Save Session'
      click_on 'Ask Jack'
      fill_in 'Title', :with => "Test Post!"
      fill_in 'Body', :with => "This is a question!"
      click_on 'Create Post'
      click_on 'Test Post!'
      click_on "Upvote"
      expect( page ).to have_content(1)
    end
  end
end