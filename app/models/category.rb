class Category < ApplicationRecord
    has_many :move_categories
    has_many :move_tutorials, through: :move_categories


end
