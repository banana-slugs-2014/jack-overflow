require 'spec_helper'


describe SearchesController do

let(:user){FactoryGirl.create :user}
let!(:my_question){FactoryGirl.create :question}
let!(:my_answer){FactoryGirl.create :answer, question: my_question}


  context '#search' do
    describe "A user (logged in or not) can search for questions in the JackOverflow database" do
      before(:each){ get :search, search_term: my_question.title }
      it{ returns_valid_response }
      xit "should return search results" do
        expect(response.body).to include "#{my_question.title}"
      end
    end
  end
end