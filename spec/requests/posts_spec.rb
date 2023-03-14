require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.')
    end
    it 'Test for http status' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get "/users/#{@user.id}/posts"
      expect(response).to render_template('index')
    end
    it 'Test for response body includes correct placeholder text' do
      get "/users/#{@user.id}/posts"
      expect(response.body).to include 'All Posts'
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.')
      @post = Post.create(author: @user, title: 'first post', text: 'text')
    end
    it 'Test for http status' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to render_template('show')
    end
    it 'Test for response body includes correct placeholder text' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response.body).to include 'Here is a detail of post'
    end
  end
end
