class MoveTutorial < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :comments
   has_many :comments, dependent: :destroy

  
    accepts_nested_attributes_for :category, reject_if: :all_blank
    accepts_nested_attributes_for :comments
    # accepts_nested_attributes_for :comments
  
    
    validates :name, uniqueness: true
    validates :name, presence: true
    # validates :difficulty, inclusion: {in: %w(beginner intermediate advance)}
  
    # def category_attributes=(hash)
    #   category = Category.find_or_create_by(type: hash[:name])
    #   self.category = category
    # end
  
    # def comment_attributes=(ca)
    #   ca.values.each do |c|
    #     com = Comment.find_or_create_by(c)
        
    #     self.comment_attributes.build(comment:com)
    #   end
  
  
    # end
  end
  