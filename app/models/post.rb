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
  validate :image_type


  private

  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
    if image.attached?
      if image.blob.byte_size > 30000000
        errors.add(:image, 'is too big bro')
      end
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, "needs to be a jpeg or png!")
      end
    end
  end
end
