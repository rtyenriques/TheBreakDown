class MoveTutorial < ApplicationRecord
 has_many :move_categories
 has_many :comments
 has_many :categories, through: :move_categories
 has_many :users, through: :comments


  accepts_nested_attributes_for :categories, reject_if: :all_blank

  # def category_attributes=(hash)
  #   category = Category.find_or_create_by(type: hash[:name])
  #   self.category = category
  # end
end
