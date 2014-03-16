require 'spec_helper'


describe SearchesController do
  let(:my_question){FactoryGirl.create :question}
  let(:my_post) { FactoryGirl.create(:post) }
  context '#search' do
    context "A user (logged in or not) can search for questions in the JackOverflow database" do
      get :search, search_term: question.title
      expect(response.body).to include 'form'
    end
  end
end