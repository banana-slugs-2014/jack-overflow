require 'spec_helper'
describe PostsController do

def returns_valid_response
  expect(response).to be_ok
end

def returns_valid_redirect
  it{ expect(response).to be_redirect }
end

let(:user){FactoryGirl.create :user}
let(:my_question){FactoryGirl.create :post}
let(:my_answer){FactoryGirl.create :post, parent_id: my_question.id}
  context "#index" do
    before(:each){ get :index }
    it{ returns_valid_response }

    it "should assign @posts to every post that is a question" do
      expect(assigns(:questions)).to eq Post.where(parent.id != nil )
    end
  end



  context '#show' do

  before(:each){ get :show, id: post1.id }
    xit{ returns_valid_response }

    xit "should show a single post(question) with any child posts" do
    end

  end

  #context ''










  describe "A logged in user should be able to make a post (question)" do
  end

end
