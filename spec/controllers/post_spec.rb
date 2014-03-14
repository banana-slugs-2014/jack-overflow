require 'spec_helper'
describe PostsController do

def returns_valid_response
  expect(response).to be_ok
end

def returns_valid_redirect
  it{ expect(response).to be_redirect }
end

let(:user){FactoryGirl.create :user}
let!(:my_question){FactoryGirl.create :post}
let!(:my_answer){FactoryGirl.create :post, parent_id: my_question.id}
  context "#index" do
    before(:each){ get :index }
    it{ returns_valid_response }

    it "should assign @posts to every post that is a question" do

      expect(assigns(:questions)).to eq Post.where(parent_id: nil)
    end
  end

  context '#show' do
    context "when :id is the id of a question" do
    before(:each){ get :show, id: my_question.id }
      it{ returns_valid_response }
      it "it should assign @question to my_question" do
        expect(assigns(:question)).to eq my_question
      end
    end

    context "when :id is invalid" do
      before(:each){ get :show, id: "red" }
      it { expect(response).to be_redirect }
    end
  end

  context '#edit' do
    context "when editting a question" do
      before(:each){ get :edit, id: my_question.id }
      it{ returns_valid_response }
      it "it should assign @question to my_question" do
        expect(assigns(:post)).to eq my_question
      end
    end

    context "when editting a question" do
      before(:each){ get :edit, id: my_answer.id }
      it{ returns_valid_response }
      it "it should assign @question to my_answer" do
        expect(assigns(:post)).to eq my_answer
      end
    end
  end

  context '#new' do
    context "when creating a question" do
      before(:each){ get :new }
      it { returns_valid_response }
      it "it should create a new instance of post" do
        expect(assigns :post).to be_a_new Post
      end
    end
  end

end
