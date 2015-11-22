require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    before { get :new}

    it "returns sign-up form" do
      expect(response).to render_template 'users/new'
    end
    it "creates new user" do
      expect(assigns(:user)).to be_a User
    end
  end

  describe "GET #show" do
    let!(:user) {FactoryGirl.create(:user)}
    before {get :show, id: user.id}

    it "assigns @user" do
      expect(assigns(:user)).to eq user
    end

    it "renders users#show template" do
      expect(response).to render_template 'users/show'
    end
  end

  describe "GET #edit" do
    let!(:user) { FactoryGirl.create(:user) }
    before { get :show, id: user.id }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
