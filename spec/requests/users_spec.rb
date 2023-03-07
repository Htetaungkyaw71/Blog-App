require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'Test for http status' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get users_path
      expect(response).to render_template('index')
    end
    it 'Test for response body includes correct placeholder text' do
      get users_path
      expect(response.body).to include 'All Users'
    end
  end

  describe 'GET /show' do
    it 'Test for http status' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get '/users/1'
      expect(response).to render_template('show')
    end
    it 'Test for response body includes correct placeholder text' do
      get '/users/1'
      expect(response.body).to include 'Here is a given user'
    end
  end
end
