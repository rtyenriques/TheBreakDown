class User < ApplicationRecord
    has_secure_password
   
    has_many :comments, dependent: :destroy
    has_many :move_tutorials, dependent: :destroy
    has_many :move_tutorials, through: :comments, dependent: :destroy
    has_many :categories, through: :move_tutorials, dependent: :destroy

    validates :username, :email, uniqueness: true
    validates :username, :email, :password, presence: true
    validates :password, length: {in: 6..20}
    
end
