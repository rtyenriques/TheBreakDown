class MoveCategory < ApplicationRecord
  belongs_to :move_tutorial
  belongs_to :category
end
