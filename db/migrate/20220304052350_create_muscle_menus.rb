class CreateMuscleMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :muscle_menus do |t|
      t.string :name

      t.timestamps
    end
  end
end
