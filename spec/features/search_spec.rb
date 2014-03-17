require 'spec_helper'

describe "search", js: false do
  let!(:myuser) { FactoryGirl.create :user }
  let!(:myquestion) { FactoryGirl.create :question, user: myuser }
  let!(:myanswer) { FactoryGirl.create :answer, question: myquestion }

  it "should be able to search a title" do
    visit sign_in_path
    fill_in 'Username', :with => myuser.username
    fill_in 'Password', :with => myuser.password
    click_on 'Save Session'
    visit root_path
    fill_in 'search_term', with: myquestion.title
    click_on 'Search JackOverflow!'
    expect(page).to have_content myquestion.title
  end
end