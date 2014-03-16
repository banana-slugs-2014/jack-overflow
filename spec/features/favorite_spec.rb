require 'spec_helper'

describe "Favorites" do

  let!(:user ) { FactoryGirl.create :user }
  let!(:myuser) { FactoryGirl.create :user }
  # let()
  describe "Ask a question" do
    xit "should let a user log in and Ask Jack" do
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
      fill_in 'Username', :with => myuser.username
      fill_in 'Password', :with => myuser.password
      click_on 'Save Session'
      click_on "Test Post!"
      fill_in "Body", :with => "This is great!"
      click_on "Submit Answer"
      click_on "Sign Out"
      click_on "Sign In"
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => user.password
      click_on 'Perferendis soluta ipsum ad ratione facilis sit. '
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
  # #     expect( page ).to have_content "Test Post!"
  #   end
  # end


end