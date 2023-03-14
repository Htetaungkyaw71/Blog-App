require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'Index page' do
    before(:each) do
      @first_person = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                  bio: 'Teacher from Mexico.')
      visit('/users')
    end
    it 'i can see all username' do
      expect(page).to have_content('Tom')
    end
    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content(@first_person.posts_counter)
    end
    it 'I can see the profile picture for each user.' do
      expect(@first_person.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
    end
    it "When I click on a user, I am redirected to that user's show page." do
      visit('/users')
      click_link(href: "/users/#{@first_person.id}")
      expect(page).to have_content('Here is a detail of user')
    end
  end
end
