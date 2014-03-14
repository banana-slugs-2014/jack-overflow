require 'spec_helper'

describe VotesController do
  render_views

  let(:my_user) { FactoryGirl.create(:user) }
  let(:my_vote){ FactoryGirl.create(:vote) }
  let(:my_vote_attribs){ FactoryGirl.attributes_for(:vote) }
  let(:my_post) { FactoryGirl.create(:post) }
  context "#create" do
    it 'is ok' do
      xhr :post, :create, { vote: my_vote_attribs, id: my_post.id }, { user_id: my_user.id }
      expect(response).to be_success
    end

    it 'creates a vote in the database' do
      expect {
        xhr :post, :create, { vote: my_vote_attribs, id: my_post.id }, { user_id: my_user.id }
        }.to change{Vote.count}.by(1)
    end

    it 'renders the updated vote count' do
      expect {
        xhr :post, :create, vote: my_vote_attribs
        }.to render_template("votes/vote_count")
    end
  end

  context "#update" do
    pending
  end
end