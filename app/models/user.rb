class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name,
  length: { minimum: 2, maximum: 20, message: "is too short (minimum is 2 characters)" }

  has_many :books, dependent: :destroy
end
