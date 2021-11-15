class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :move_tutorial
  accepts_nested_attributes_for :user
 
  # validates :title, :content, :rating, presence: true

  def self.rating_three_and_up
     self.where(rating: 3..5)
  end
end

