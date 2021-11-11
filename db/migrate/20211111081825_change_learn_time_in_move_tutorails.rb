class ChangeLearnTimeInMoveTutorails < ActiveRecord::Migration[6.1]
  def change
    change_column :move_tutorials, :learn_time, :integer
  end
end
