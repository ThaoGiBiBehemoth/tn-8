class Task < ApplicationRecord
  belongs_to :User
  has_many :Item
  validates :title, presence: true, length: {maximum: 50}
end
