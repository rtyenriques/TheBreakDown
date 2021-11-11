class MoveTutorial < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :comments
   has_many :comments, dependent: :destroy

    accepts_nested_attributes_for :category, reject_if: :all_blank
    accepts_nested_attributes_for :comments
  
    validates :name, uniqueness: true
    validates :name, presence: true
    validates :difficulty, inclusion: {in: %w(beginner intermediate advance)}

    def self.difficulty_beginner
      self.where(difficulty: 'beginner')
    end
  
    
  end
  