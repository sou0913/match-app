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
  end
end
