class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximium: 50}
  validates :description, presence: true, length: { minimum: 3, maximium: 300}
  validates :image, presence: true
  validates :user_id, :presence => true
end
