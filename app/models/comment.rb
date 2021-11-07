class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :move_tutorial
  accepts_nested_attributes_for :user
 
  validates :title, :content, :rating, presence: true
end

