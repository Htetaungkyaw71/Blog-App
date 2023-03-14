require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'Test User Show View' do
    before(:each) do
      @first_person = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                  bio: 'Teacher from Mexico.')
      @first_post = Post.create(author: @first_person, title: 'first post', text: 'text')
      @second_post = Post.create(author: @first_person, title: 'second post', text: 'text')
      @third_post = Post.create(author: @first_person, title: 'third post', text: 'text')
      visit("/users/#{@first_person.id}")
    end
    it "I can see the user's profile picture." do
      expect(page.find('img')['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end
    it "I can see the user's username." do
      expect(page).to have_content(@first_person.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@first_person.posts_counter)
    end
    it "I can see the user's bio." do
      expect(page).to have_content(@first_person.bio)
    end
    it "I can see the user's first 3 posts" do
      expect(page).to have_content(@first_post.title)
      expect(page).to have_content(@second_post.title)
      expect(page).to have_content(@third_post.title)
    end
    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_selector(:link_or_button, 'See all posts')
    end

    it "When I click a user's post, it redirects me to that post's show page" do
      visit("/users/#{@first_person.id}")
      click_link(href: "/users/#{@first_person.id}/posts/#{@first_post.id}")
      expect(page).to have_content('Here is a detail of post')
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_link 'See all posts'
      expect(page).to have_content('All Posts')
    end
  end
end
