require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'user test' do
    it 'The status should be okay' do
      get '/users'
      expect(response).to have_http_status(:ok)
    end

    it 'The correct template should be rendered' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'The response body should be correct placeholder text' do
      get '/users'
      expect(response.body).to include('Lilly')
    end

    it 'return http success' do
      user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
    it 'return http success' do
      user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_path(user)
      expect(response).to render_template(:show)
    end
    it 'return http success' do
      user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_path(user)
      expect(response.body).to include('User post')
    end
  end
end
