# require 'rails_helper'
# RSpec.describe 'Users index view', type: :system do
#   describe 'Index page' do
#     before(:each) do
#       @user = User.create(id: 1, name: 'Farah', photo: 'img.jpg', bio: 'Developer', posts_counter: 0)
#       visit users_path
#     end
#     it 'Display  username of all user\'s' do
#       expect(page).to have_content('Farah')
#     end
#     it 'Display the profile picture for each user' do
#       expect(page).to have_content('Images')
#     end
#     it 'Display the number of posts each user has written' do
#       expect(page).to have_content('Number of posts: 0')
#     end
#     it 'redirects to the user show page' do
#       click_link('Farah', match: :prefer_exact)
#       expect(page).to have_content('Bio:')
#     end
#   end
# end
require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'User index page' do
    before(:each) do
      @user = User.create(name: 'Faranosh',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'I am a Full Stack Developer',
                          posts_counter: 0)

      visit users_path
    end

    it 'displays the user name of all other users' do
      expect(page).to have_content(@user.name)
    end

    it 'displays the user photo of all other users' do
      expect(page.body).to include(@user.photo)
    end

    it 'displays the number of posts each user has written' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "When I click on a user, I am redirected to that user's show page" do
      click_link(@user.name)
      expect(page).to have_content(@user.bio)
    end
  end
end
