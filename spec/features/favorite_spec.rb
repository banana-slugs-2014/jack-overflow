require 'spec_helper'

describe "Favorites" do
  let!(:myuser) { FactoryGirl.create :user }
  let!(:myquestion) { FactoryGirl.create :question, user: myuser }
  let!(:myanswer) { FactoryGirl.create :answer, question: myquestion }


  describe "Ask a question", js: false do
    it "should let a user log in and Ask Jack" do
      visit new_session_path
      click_on "Sign In"
      fill_in 'Username', :with => myuser.username
      fill_in 'Password', :with => myuser.password
      click_on 'Save Session'
      click_on "JackOverflow"
      click_on "#{myquestion.title}"
      click_on 'Mark as Favorite'
      expect( page ).to have_content("Marked as Favorite")
    end
  end

  describe "Ask a question" do
    it "should let a user log in and Ask Jack" do
      visit new_session_path
      click_on "Sign In"
      fill_in 'Username', :with => myuser.username
      fill_in 'Password', :with => myuser.password
      click_on 'Save Session'
      click_on 'Ask Jack'
      fill_in 'Title', :with => "Test Post!"
      fill_in 'Body', :with => "This is a question!"
      click_on 'Create Post'
      expect( page ).to have_content "Test Post!"
    end
  end


end