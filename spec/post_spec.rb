require 'spec_helper'
describe PostsController do

  context "#index" do
    before(:each){ get :index }
    it{ expect(response).to be_ok }

    xit "should assign @posts to every post that is a question" do

    end
  end











  describe "A logged in user should be able to make a post (question)" do
  end

end
