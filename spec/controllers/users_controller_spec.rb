# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  describe 'get #first' do
    it 'redirect to root path' do
      user = create(:user)
      sign_in user
      get :first, params: { id: user }
      expect(response).to redirect_to('/')
    end
    it 'renders the :first template' do
      user = create(:user, role: nil)
      sign_in user
      get :first, params: {id: user}
      expect(response).to render_template :first
    end
  end
  describe 'get #index' do
    it "renders the :index template" do
      user = create(:user)
      sign_in user
      get :index
      expect(response).to render_template :index
    end
    it 'redirect to sign_in path unless users sign in' do
      get :index
      expect(response).to redirect_to(user_session_path)
    end
    it 'assigns the requested users to @users' do
      users = create_list(:user, 3)
      get :index
      expect(response).to render_template :index
  end
  describe 'get #show' do
    it 'renders the :show template' do
      user = create(:user)
      sign_in user
      get :show, params: {id: user}
      expect(response).to render_template :show
    end
    it 'redirect to sign_in path unless users sign in' do
      get :show, params: {id: 1}
      expect(response).to redirect_to(user_session_path)
    end
    it 'assigns the requested user to @user' do
      user = create(:user)
      sign_in user
      get :show, params: {id: user}
      expect(assigns(:partner)).to eq user
    end
  end
  describe 'get #edit' do
    it 'renders the :edit template' do
      user = create(:user)
      sign_in user
      get :edit, params: {id: user}
      expect(response).to render_template :edit
    end
  end
  describe 'get #favor' do
    it 'renders the :favor template' do
      user = create(:user)
      sign_in user
      get :favor, params: {id: user}
      expect(response).to render_template :favor
    end
  end
  describe 'get #be_favored' do
    it 'renders the :be_favored template' do
      user = create(:user)
      sign_in user
      get :be_favored, params {id: user}
      expect(response).to render_template :be_favored
    end
  end
  describe 'get #match' do
    it 'renders the :match template' do
      user = create(:user)
      sign_in user
      get :match, params {id: user}
      expect(response).to render_template :match
    end
  end

end
