require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'Test Post index View' do
    before(:each) do
      @first_person = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                  bio: 'Teacher from Mexico.')
      @first_post = Post.create(author: @first_person, title: 'first post', text: 'text')
      @second_post = Post.create(author: @first_person, title: 'second post', text: 'text')
      @third_post = Post.create(author: @first_person, title: 'third post', text: 'text')
      @first_comment = Comment.create(author: @first_person, post: @first_post, text: 'comment')
      @first_like = Like.create(author: @first_person, post: @first_post)
      visit("/users/#{@first_person.id}/posts/#{@first_post.id}")
    end
    it 'I can see who wrote the post' do
      expect(page).to have_content(@first_person.name)
    end
    it 'I can see post title.' do
      expect(page).to have_content(@first_post.title)
    end
    it 'I can see post body.' do
      expect(page).to have_content(@first_post.text)
    end
    it 'I can see post comments.' do
      expect(page).to have_content(@first_post.comments_counter)
    end
    it 'I can see post like.' do
      expect(page).to have_content(@first_post.likes_counter)
    end
    it 'I can see the username of each commentor.' do
      expect(page).to have_content(@first_comment.author.name)
    end
    it 'I can see the comment each commentor left.' do
      expect(page).to have_content(@first_comment.text)
    end
  end
end
