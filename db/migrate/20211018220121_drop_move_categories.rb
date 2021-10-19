class DropMoveCategories < ActiveRecord::Migration[6.1]
  def change
    drop_table :move_categories
  end
end
