class MoveTutorial < ApplicationRecord
belongs_to :user
belongs_to :category
 has_many :comments

 has_many :users, through: :comments


  accepts_nested_attributes_for :category, reject_if: :all_blank

  # def category_attributes=(hash)
  #   category = Category.find_or_create_by(type: hash[:name])
  #   self.category = category
  # end
end
