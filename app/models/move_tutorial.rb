class MoveTutorial < ApplicationRecord
belongs_to :user
belongs_to :category
 has_many :comments, dependent: :destroy

 has_many :users, through: :comments


  accepts_nested_attributes_for :category, reject_if: :all_blank

  
  validates :name, uniqueness: true
  validates :name, presence: true
  # validates :difficulty, inclusion: {in: %w(beginner intermediate advance)}

  # def category_attributes=(hash)
  #   category = Category.find_or_create_by(type: hash[:name])
  #   self.category = category
  # end
end
