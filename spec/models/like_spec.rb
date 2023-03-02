require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Like counter should be one' do
    first_person = User.create(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_person, title: 'Hello', text: 'This is my first post')
    Like.create(author: first_person, post: first_post)

    expect(first_post.likes_counter).to eq(1)
  end
end
