class Book < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true
  validates :title, :body, length: { in: 1..200 }
end
