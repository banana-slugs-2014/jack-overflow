require 'spec_helper'


describe SearchesController do

let(:user){FactoryGirl.create :user}
let!(:my_question){FactoryGirl.create :question}
let!(:my_answer){FactoryGirl.create :answer, question: my_question}

  context '#search' do
    before(:each){ get :search, search_term: my_question.title }
    it{ returns_valid_response }
  end
end