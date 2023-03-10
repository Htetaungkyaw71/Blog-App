require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'postCounter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'postCounter should be integer' do
    subject.posts_counter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'Users post length should be three' do
    first_person = User.create(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    Post.create(author: first_person, title: 'Hello', text: 'This is my first post')
    Post.create(author: first_person, title: 'Hello', text: 'This is my first post')
    Post.create(author: first_person, title: 'Hello', text: 'This is my first post')
    expect(first_person.recent_three_posts.length).to eq(3)
  end
end
