class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :text, presence: true

  def update_comments_counter
    update_attribute(:comments_counter, comments.count)
  end

  def recent_comments
    Comment.where(post: self).order(updated_at: :desc).limit(5)
  end
end
