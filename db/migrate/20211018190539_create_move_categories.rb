class CreateMoveCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :move_categories do |t|
      t.belongs_to :move_tutorial, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
