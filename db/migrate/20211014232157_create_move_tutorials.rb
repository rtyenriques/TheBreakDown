class CreateMoveTutorials < ActiveRecord::Migration[6.1]
  def change
    create_table :move_tutorials do |t|
      t.string :name
      t.string :difficulty
      t.string :learn_time
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
