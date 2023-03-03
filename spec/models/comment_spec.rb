require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Comments counter should be 1' do
    first_person = User.create(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_person, title: 'Hello', text: 'This is my first post')
    Comment.create(author: first_person, post: first_post, text: 'This is my first comment')

    expect(first_post.comments_counter).to eq(1)
  end
end
