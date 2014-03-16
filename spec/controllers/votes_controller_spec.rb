require 'spec_helper'

describe VotesController do
  render_views

  let(:my_vote){ FactoryGirl.create(:vote) }
  let(:my_vote_attribs){ FactoryGirl.attributes_for(:vote) }
  let!(:my_post) { FactoryGirl.create(:post) }
  let(:alt_attribs) { {value: -1} }
  let(:my_user) { FactoryGirl.create(:user) }
  let(:vote_error) { 'Sign In to Vote!'}

  describe "#create" do
    context 'logged in user' do
      xit 'is ok' do
        xhr :post, :create,
        { value: 1, post_id: my_post.id },
        { user_id: my_user.id }

        expect(response).to be_success
      end

      xit 'creates a vote in the database' do
        session[:user_id] = my_user.id
        expect {
          xhr :post, :create,
          { value: 1, post_id: my_post.id },
          { user_id: my_user.id }
          }.to change{Vote.count}.by(1)
      end

      xit 'renders the updated vote count' do
        xhr :post, :create,
        { value: 1, post_id: my_post.id },
        { user_id: my_user.id }

        expect(response).to render_template(partial: "votes/_vote_count")
      end
    end
    context 'guest user' do
      before(:each){session.clear}
      xit 'is ok' do
        xhr :post, :create,
        { value: 1, post_id: my_post.id }
        expect(response).to be_success
      end

      xit 'renders error message' do
        xhr :post, :create,
        { value: 1, post_id: my_post.id }

        expect(response).to render_template(partial: 'shared/_sign_in_error')
      end

      xit 'does not add a vote to the database' do
        expect {
          xhr :post, :create,
          { value: 1, post_id: my_post.id }
          }.to_not change{Vote.count}
      end
    end
  end

  describe "#update" do
    context 'logged in user' do
      xit 'is ok' do
        xhr :put, :update,
        { vote_id: my_vote.id, vote: alt_attribs, post_id: my_post.id },
        { user_id: my_vote.user.id }

        expect(response).to be_success
      end

      xit 'does not change vote count in database' do
        expect {
          xhr :put, :update,
          { vote_id: my_vote.id, vote: alt_attribs, post_id: my_post.id },
          { user_id: my_vote.user.id }
          }.to_not change{Vote.count}
      end

      xit 'renders the updated vote count' do
        xhr :put, :update,
        { vote_id: my_vote.id, vote: alt_attribs, post_id: my_post.id },
        { user_id: my_vote.user.id }

        expect(response).to render_template(partial: "votes/_vote_count")
      end
    end
  end
end