require 'rails_helper'

RSpec.describe User, type: :model do
    it 'should be valid' do
        user = User.create(name: nil)
        expect(user).to_not be_valid
    end
    it 'recent_posts should return last posts' do
        user = User.create(name: 'Faranosh')
        post = Post.create(author: user, title: 'First post', comments_counter:0, likes_counter:0)
        expect(user.recent_posts).to include(post)
    end
end          