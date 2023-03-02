require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Mexico.')
  subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  before { subject.save }

  it 'name should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'Title should be not exceed 250 characters.' do
    subject.title = 'a' * 260
    expect(subject).to_not be_valid
  end
  it 'CommentCounter should be greater than and equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'CommentCounter should be integer' do
    subject.comments_counter = 'hello'
    expect(subject).to_not be_valid
  end
  it 'LikeCounter should be greater than and equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  it 'LikeCounter should be integer' do
    subject.likes_counter = 'hello'
    expect(subject).to_not be_valid
  end
end
