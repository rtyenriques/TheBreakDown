class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :move_tutorial
  accepts_nested_attributes_for :user
 
  validates_presence_of :title, :content, :rating

  def self.rating_three_and_up
     self.where(rating: 3..5)
  end
end

