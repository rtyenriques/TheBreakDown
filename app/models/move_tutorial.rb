class MoveTutorial < ApplicationRecord
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :categories

  # def category_attributes=(hash)
  #   category = Category.find_or_create_by(type: hash[:name])
  #   self.category = category
  # end
end
