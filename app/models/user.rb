class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :role
  has_many :evaluations

  def admin?
    role_id == 1
  end

  def comentarista?
    role_id == 2
  end
end
