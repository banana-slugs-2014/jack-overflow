require 'spec_helper'

describe UsersController do
  let(:myuser) { create :user }
  let(:attribs) { attributes_for :user }
  let(:invalid_attribs) { attributes_for :user, username: "" }

  context "#index" do
    before(:each){ get :index }
    it{expect(response).to be_ok }
    it "should show all users" do
      expect(assigns(:users)).to eq User.all
    end
  end

  context "#new" do
    before(:each){ get :new }
    it{expect(response).to be_ok }
    it "should create a new user instance" do
      expect(assigns(:user)).to be_a_new User
    end
  end

  context "#show" do
    before(:each){ get :show, user: myuser }
    it{expect(response).to be_ok }
    it "should show the current user" do
      expect(assigns(:user)).to eq(myuser)
    end
  end

  context "#create" do
    context "valid params" do
    before(:each){ post :create, user: attribs }
      it{expect(response).to be_redirect }
      it "should create a user " do
        expect{post :create, user: attribs }.to change { User.count }.by(1)
      end
    end

    context "with invalid params" do
      before(:each){ post :create, user:{ username: "" } }
      # it "should not allow a creation of a todo" do
      #   expect{ post :create, user:{ username: "" } }.to_not change {User.count}
      # end
    end
  end


  context "#edit" do
    before(:each){ get :edit, id: myuser }
    it{expect(response).to be_ok }
  end

  # context "#update" do
  #   before(:each){ post :update }
  #   it{expect(response).to be_ok }

  # end

  # context "#destroy" do
  #   before(:each){ delete :destroy }
  #   it{expect(response).to be_ok }


  # end


end