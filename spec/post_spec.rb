require 'spec_helper'
describe PostsController do

def valid_response
  it{ expect(response).to be_ok }
end

def valid_redirect
  it{ expect(response).to be_redirect }
end

let(:my_question){}
let(:my_answer){}
  context "#index" do
    before(:each){ get :index }
    it{ expect(response).to be_ok }
      # valid_response

    xit "should assign @posts to every post that is a question" do
    end
  end



  context '#show' do

  before(:each){ get :show id: post1.id }
    xit "should receive a valid response at a posts/:id" do
    end

    xit "should show a single post(question) with any child posts" do
    end

  end

  #context ''










  describe "A logged in user should be able to make a post (question)" do
  end

end
