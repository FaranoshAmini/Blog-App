class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id
  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true

  def update_comments_counter
    update_attribute(:comments_counter, comments.count)
  end

  def recent_comments
    Comment.where(post: self).order(updated_at: :desc).limit(5)
  end
end
