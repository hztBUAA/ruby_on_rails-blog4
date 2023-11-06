class Blog < ApplicationRecord
  validates :title, :content, presence: true
  has_many :comments
  belongs_to :user
end
