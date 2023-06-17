require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/users' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'should render users/index template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'should list all users' do
      get '/users'
      expect(response.body).to include('Here is a list of user')
    end
  end

  describe 'GET/users/:id' do
    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'should render users/show template' do
      get '/users/:id'
      expect(response).to render_template('show')
    end

    it 'should list all users' do
      get '/users/:id'
      expect(response.body).to include('show user')
    end
  end
end
