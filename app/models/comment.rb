class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :move_tutorial
  
  validates_presence_of :title, :content, :rating
  validates_inclusion_of :rating, :in => 1..5, message: "%{value} must be a number from 1 to 5"

  def self.rating_three_and_up
     self.where(rating: 3..5)
  end
end

