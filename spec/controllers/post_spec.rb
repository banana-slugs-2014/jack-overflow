require 'spec_helper'
describe PostsController do

let(:user){FactoryGirl.create :user}
let(:my_question){FactoryGirl.create :question}
let(:my_answer){FactoryGirl.create :answer, question: my_question}
let(:attribs){FactoryGirl.attributes_for :post, body: "dat update"}
let(:answer_attribs){FactoryGirl.attributes_for :post, question_id: 1}

  context "#index" do
    before(:each){ get :index }
    it{ returns_valid_response }
    it "should assign @posts to every post that is a question" do
      expect(assigns(:questions)).to eq Post.where(question_id: nil)
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
      it { returns_valid_redirect }
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

    context "when editting an answer" do
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

  context '#update' do
    context 'when updating a question' do

    context 'with valid attributes' do
      before(:each){ put :update, id: my_question.id, post: {body: attribs[:body]} }
        it { returns_valid_redirect }
        it "should update a post" do
          expect{
            my_question.reload.body
            }.to change{my_question.body}.to(attribs[:body])
        end
      end
    end

    context 'with invalid attributes' do
      before(:each){ put :update, id: my_question.id, post: {body: ""} }
      it { returns_valid_redirect }
      it "should not update a post" do
        expect{
          my_question.reload.body
          }.to_not change{my_question.body}
      end
    end
  end

  context 'when updating a answer' do
    context 'with valid attributes' do
      before(:each){ put :update, id: my_answer.id, post: {body: attribs[:body]} }
        it { returns_valid_redirect }
        it "should update a post" do
          expect{
            my_answer.reload.body
            }.to change{my_answer.body}.to(attribs[:body])
        end
      end
    end

    context 'with invalid attributes' do
      before(:each){ put :update, id: my_answer.id, post: {body: ""} }
      it { returns_valid_redirect }
      it "should not update a post" do
        expect{
          my_answer.reload.body
          }.to_not change{my_answer.body}
      end
    end
  end

  context "#create" do
    context 'creating a question' do
    before(:each){ session[:user_id] = user.id }

      context "with valid params" do
        before(:each){ post :create, post: attribs }
        it { returns_valid_redirect }
        it "should increase the Post count" do
          expect{
            post :create, post: attribs
          }.to change{Post.count}.by(1)
        end
      end

      context 'with invalid params' do
        before(:each){ post :create, post: {title: "red", body: ""} }
        it { returns_valid_redirect }
        it "should increase the Post count" do
          expect{
            post :create, post: {title: "red", body: ""}
          }.to_not change{Post.count}
        end
      end
    end

    context 'creating an answer' do
    before(:each){ session[:user_id] = user.id }

      context "with valid params" do
        before(:each){ post :create, post: answer_attribs }
        it { returns_valid_redirect }
        it "should increase the Post count" do
          expect{
            post :create, post: answer_attribs
          }.to change{Post.count}.by(1)
        end
      end

      context 'with invalid params' do
        before(:each){ post :create, post: {title: "red", body: ""} }
        it { returns_valid_redirect }
        it "should increase the Post count" do
          expect{
            post :create, post: {title: "red", body: ""}
          }.to_not change{Post.count}
        end
      end
    end
  end
end
