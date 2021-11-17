class Category < ApplicationRecord
    
  has_many :move_tutorials
  has_many :users, through: :move_tutorials

  
end
