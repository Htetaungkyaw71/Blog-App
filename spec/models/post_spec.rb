require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Mexico.')
  subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }
  before { subject.save }

  it 'name should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'Title should be not exceed 250 characters.' do
    subject.title = 'a' * 260
    expect(subject).to_not be_valid
  end
  it 'CommentCounter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'CommentCounter should be integer' do
    subject.comments_counter = 'hello'
    expect(subject).to_not be_valid
  end
  it 'LikeCounter should be greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  it 'LikeCounter should be integer' do
    subject.likes_counter = 'hello'
    expect(subject).to_not be_valid
  end


  it 'UpdatePostCounter should not be nil' do
    first = User.create(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.')
    Post.create(author: first, title: 'Hello', text: 'This is my first post')
    expect(first.posts_counter).to_not be_nil
  end

  it 'Comments length should be five' do
    first_person = User.create(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_person, title: 'Hello', text: 'This is my first post')
    Comment.create(post: first_post, author: first_person, text: 'Hi Tom!')
    Comment.create(post: first_post, author: first_person, text: 'Hi Tom!')
    Comment.create(post: first_post, author: first_person, text: 'Hi Tom!')
    Comment.create(post: first_post, author: first_person, text: 'Hi Tom!')
    Comment.create(post: first_post, author: first_person, text: 'Hi Tom!')
    expect(first_post.recent_five_comments.length).to eq(5)
  end
end
