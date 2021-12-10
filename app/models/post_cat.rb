class PostCat < ApplicationRecord
  belongs_to :category
  belongs_to :post
  has_many :posts
  has_many :categories
  has_many :evaluations
end
