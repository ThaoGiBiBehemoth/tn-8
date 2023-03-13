class Task < ApplicationRecord
  belongs_to :User
  validates :title, presence: true, length: {maximum: 50}
end
