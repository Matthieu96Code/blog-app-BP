require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/users/:user_id/posts' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'should render posts/index template' do
      get '/users/:user_id/posts'
      expect(response).to render_template('index')
    end

    it 'should list all posts for a given user' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Here is a list of posts for a given use')
    end
  end

  describe 'GET/users/:user_id/posts/:id' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'should render posts/show template' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template('show')
    end

    it 'should show a post for given user' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('from user')
    end
  end
end
