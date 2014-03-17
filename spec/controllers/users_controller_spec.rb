require 'spec_helper'

describe UsersController do
  let(:myuser) { create :user }
  let(:attribs) { attributes_for :user }
  let(:update_attribs) { attributes_for :user, username: "johnny" }


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
    before(:each){ get :show, id: myuser, user: myuser }
    it{expect(response).to be_ok }
    it "should show the current user" do
      expect(assigns(:user)).to eq(myuser)
    end
  end

  context "#create" do
    context "valid params" do
      it{expect(post :create, user: attribs).to be_redirect}
      it "should create a user " do
        expect{post :create, user: attribs }.to change { User.count }.by(1)
      end
    end

    context "with invalid params" do
      let(:invalid_attribs) { attributes_for :user, username: "" }
      it "should not allow a creation of a todo" do
        expect{ post :create, user: invalid_attribs }.to_not change {User.count }
      end
    end
  end


  context "#edit" do
    before(:each){ get :edit, id: myuser, user: myuser }
    it{expect(response).to be_ok }
    it "should create an instance of the specific user" do
      expect(assigns(:user)).to eq(myuser)
    end
  end

  context "#update" do
    context "valid params" do
      before(:each){ post :update, id: myuser, user: update_attribs }
      it "should update the instance of the object" do
        expect{ myuser.reload.username }.to change{ myuser.username}.to "johnny"
      end
    end
    context "with invalid params" do
      let(:invalid_attribs) { attributes_for :user, username: "" }
      it "should not allow a user change" do
        post :update, id: myuser, user: invalid_attribs
        expect(myuser.reload.username).to_not eq ""
      end
    end
  end

  context "#destroy" do
   let!(:otheruser) { create :user }
    it "should delete a user" do
      expect{ delete :destroy, id: otheruser }.to change{User.count}.by(-1)
    end
    it  "should redirect" do
      expect(delete :destroy, id: otheruser).to be_redirect
    end
  end


end