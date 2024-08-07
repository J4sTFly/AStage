# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  include Rails.application.routes.url_helpers
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #edit' do
    let(:user) { create(:user) }

    before do
      login_user(user)
    end

    it 'returns json with user fields' do
      get :edit, params: { id: user.id }

      expect(response.body).to eq(UserSerializer.new(user).call.to_json)
    end
  end

  describe 'POST #create' do
    it 'returns succes with valid params' do
      post :create, params: { user: { email: Faker::Internet.email,
                                      username: Faker::Internet.username,
                                      password: Faker::Alphanumeric.alpha(number: 10) } }
      expect(response).to have_http_status :ok
    end

    it 'return 400 with invalid params' do
      post :create, params: { user: { email: Faker::Internet.username,
                                      username: '',
                                      password: Faker::Alphanumeric.alpha(number: 2) } }

      expect(response).to have_http_status :bad_request
    end
  end

  describe 'POST #login' do
    let(:user) { create(:user) }

    it 'returns token if password is correct' do
      post :login, params: { user: { email: user.email,
                                     password: user.password } }

      expect(response.body).to eq(login_user(user))
    end

    it 'return 400 if bad credentials' do
      post :login, params: { user: { email: Faker::Internet.email,
                                     password: '' } }
      expect(response).to have_http_status :bad_request
    end
  end
end
