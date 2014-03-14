require 'spec_helper'

describe VotesController do
  render_views

  let(:my_vote){ FactoryGirl.create(:vote) }
  let(:my_vote_attribs){ FactoryGirl.attributes_for(:vote) }
  let(:my_post) { FactoryGirl.create(:post) }
  let(:alt_attribs) { {value: -1} }
  let(:my_user) { FactoryGirl.create(:user) }
  let(:vote_error) { 'Sign In to Vote!'}

  describe "#create" do
    context 'logged in user' do
      it 'is ok' do
        xhr :post, :create,
        { vote: my_vote_attribs, id: my_post.id },
        { user_id: my_user.id }

        expect(response).to be_success
      end

      it 'creates a vote in the database' do
        expect {
          xhr :post, :create,
          { vote: my_vote_attribs, id: my_post.id },
          { user_id: my_user.id }
          }.to change{Vote.count}.by(1)
      end

      it 'renders the updated vote count' do
        xhr :post, :create,
        { vote: my_vote_attribs, id: my_post.id },
        { user_id: my_user.id }

        expect(response).to render_template(partial: "votes/_vote_count")
      end
    end
    context 'guest user' do
      it 'is ok' do
        xhr :post, :create,
        { vote: my_vote_attribs, id: my_post.id }

        expect(response).to be_success
      end

      it 'renders error message' do
        xhr :post, :create,
        { vote: my_vote_attribs, id: my_post.id }

        expect(response).to render_template(partial: 'shared/_sign_in_error')
      end

      it 'does not add a vote to the database' do
        expect {
          xhr :post, :create,
          { vote: my_vote_attribs, id: my_post.id }
          }.to_not change{Vote.count}
      end
    end
  end

  describe "#update" do
    context 'logged in user' do
      it 'is ok' do
        xhr :put, :update,
        { vote_id: my_vote.id, vote: alt_attribs, id: my_post.id },
        { user_id: my_vote.user.id }

        expect(response).to be_success
      end

      it 'does not change vote count in database' do
        my_vote
        expect {
          xhr :put, :update,
          { vote_id: my_vote.id, vote: alt_attribs, id: my_post.id },
          { user_id: my_vote.user.id }
          }.to_not change{Vote.count}
      end

      it 'renders the updated vote count' do
        xhr :put, :update,
        { vote_id: my_vote.id, vote: alt_attribs, id: my_post.id },
        { user_id: my_vote.user.id }

        expect(response).to render_template(partial: "votes/_vote_count")
      end
    end
  end
end