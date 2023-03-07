require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'Test for http status' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end
    it 'Test for response body includes correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include 'Here is a list of posts for a given user'
    end
  end

  describe 'GET /show' do
    it 'Test for http status' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end
    it 'Test for response body includes correct placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include 'Here is a detail of post'
    end
  end
end
