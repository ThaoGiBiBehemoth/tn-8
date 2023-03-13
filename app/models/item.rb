class Item < ApplicationRecord
  belongs_to :Task
  validates :title, length: {maximum: 50}
  validates :descrip, length: {maximum: 250}
end
