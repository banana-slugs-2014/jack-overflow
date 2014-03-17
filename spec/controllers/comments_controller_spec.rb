require 'spec_helper'

describe CommentsController do
  render_views
  let!(:comment) { FactoryGirl.create(:comment) }
  let(:attribs) { FactoryGirl.attributes_for(:comment) }
  let(:bad_attribs) { { body: '' } }
  let(:comment_error) { 'Invalid comment!' }
  let(:question) { FactoryGirl.create(:post) }

  describe "#new" do
    it "is ok" do
      get :new, post_id: question.id
      expect(response).to be_success
    end

    it "renders an empty form" do
      get :new, post_id: question.id
      expect(response.body).to include 'form'
    end

    it 'assigns @comment to Comment' do
      get :new, post_id: question.id
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

  describe "#create" do
    context 'valid comment' do
      it "is ok" do
        post :create, post_id: question.id, comment: attribs
        expect(response).to be_ok
      end

      it "adds a comment to the database" do
        expect {
        post :create, post_id: question.id, comment: attribs }
        .to change{Comment.count}.by(1)
      end
    end

    # context 'blank body invalid comment' do
    #   it "redirects to the comment's post" do
    #     post :create, post_id: question.id, comment: bad_attribs
    #     expect(response).to redirect_to(post_path(question))
    #   end

    #   it "does not add a comment to the database" do
    #     expect {
    #     post :create, post_id: question.id, comment: bad_attribs }
    #     .not_to change{Comment.count}
    #   end
    # end

  end

  describe "#edit" do
    it "is ok" do
      get :edit, id: comment.id, post_id: question.id
      expect(response).to be_success
    end

    it "renders a form" do
      get :edit, id: comment.id, post_id: question.id
      expect(response.body).to include 'form'
    end

    it 'which is prepopulated' do
      get :edit, id: comment.id, post_id: question.id
      expect(response.body).to include comment.body
    end

    it 'assigns @comment to the Comment found by id' do
      get :edit, id: comment.id, post_id: question.id
      expect(assigns(:comment)).to eql comment
    end
  end

  describe "#update" do
    context 'valid comment' do
      it "redirects to the comment's post" do
        put :update, post_id: comment.post.id, id: comment.id, comment: attribs
        expect(response).to redirect_to(post_path(comment.post))
      end
    end

    context 'blank body invalid comment' do
      it "redirects to the comment's post" do
        put :update, post_id: comment.post.id, id: comment.id, comment: bad_attribs
        expect(response).to redirect_to(post_path(comment.post))
      end
    end
  end

  describe "#destroy" do
    it "redirects to the deleted comment's post" do
      delete :destroy, post_id: comment.post.id, id: comment.id
      expect(response).to redirect_to(post_path(comment.post))
    end

    it "deletes the comment from the database" do
      expect { delete :destroy, post_id: comment.post.id, id: comment.id }
      .to change{Comment.count}.by(-1)
    end
  end

end