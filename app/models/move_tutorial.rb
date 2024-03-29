class MoveTutorial < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
 
  accepts_nested_attributes_for :category, reject_if: :all_blank
  accepts_nested_attributes_for :comments
  
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :difficulty, inclusion: {in: %w(beginner intermediate advance), message: "%{value} must be beginner, intermediate or advance"}, allow_nil: true

  def self.difficulty_beginner
    self.where(difficulty: 'beginner')
  end

  def self.learntime_under_seven
    self.where(learn_time: 1..7)
  end

  def self.last_three
    self.all.order(name: :desc).limit(3)
  end
    
  end
  