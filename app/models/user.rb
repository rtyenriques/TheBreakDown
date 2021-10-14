class User < ApplicationRecord
    has_secure_password
    has_many :move_tutorials
    has_many :categories, through: :move_tutorials 
end
