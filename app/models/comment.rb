class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one :comment

  validates_length_of :description, minimum: 1
end
