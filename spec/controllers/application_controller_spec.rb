require 'spec_helper'

describe ApplicationController do
  let(:myuser){ FactoryGirl.create :user }

  context "with valid params" do
    before(:each){session[:user_id] = myuser.id}

    context "#logged_in?" do
      it {expect(subject.logged_in?).to eq true}
    end

    context "#current_user" do
      it "should return a current user id" do
        expect(subject.current_user).to eq myuser
      end
    end
  end

  context "with invalid params" do
    context "#logged_in?" do
      it {expect(subject.logged_in?).to eq false}
    end

    context "#current_user" do
      it "should not return a current user id" do
        expect(subject.current_user).to eq nil
      end
    end
  end
end
