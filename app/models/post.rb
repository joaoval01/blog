class Post < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :post_cats, dependent: :destroy
  has_one_attached :image

  validates_presence_of :name
  validates_presence_of :summary
  validates_presence_of :content
  validates_length_of :name, maximum: 45, minimum: 2
  validates_length_of :summary, maximum: 100, minimum: 5
  validates_length_of :content, maximum: 500, minimum: 20
end
