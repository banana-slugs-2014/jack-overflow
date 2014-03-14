require 'spec_helper'

describe ApplicationController do

  context "#logged_in?" do
    context "valid params" do
    let(:myuser){ create :user }
      it "returns a session login" do
        session[:user_id] = myuser.id
        expect(subject.logged_in?).to eq true
      end
    end

    context "invalid params" do
      it "returns a false session" do
        expect(subject.logged_in?).to eq false
      end
    end


  end

  context "#current_user" do
    context "valid params" do
      pending
      # it "should return a current user id" do
        # session[:user_id] = 1
        # expect{subject.current_user.id}.to eq 1
       # end
    end
    context "invalid params" do
      it "should not return a current user id" do
        expect(subject.current_user).to eq nil
      end
    end

  end

end