class User < ApplicationRecord
    has_secure_password
   
    has_many :comments
    has_many :move_tutorials, through: :comments
    has_many :categories, through: :move_tutorials 
end
