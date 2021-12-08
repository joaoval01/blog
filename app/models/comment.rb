class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comments, dependent: :delete_all
end
