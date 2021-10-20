class User < ApplicationRecord
    has_secure_password
   
    has_many :comments
    has_many :move_tutorials
    has_many :move_tutorials, through: :comments
    has_many :categories, through: :move_tutorials 

    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true
end
