class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :deadline 
  has_many :Items
  has_one :User
end
