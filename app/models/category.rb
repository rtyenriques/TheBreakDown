class Category < ApplicationRecord
    has_many :move_tutorials  
    accepts_nested_attributes_for :move_tutorials

end
