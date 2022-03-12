class CreateMusclePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :muscle_posts do |t|
      t.string :customer_id
      t.string :muscle_menu_id
      t.integer :weight
      t.integer :times
      t.integer :body_weight
      t.string :sentence
      t.datetime :start_time

      t.timestamps
    end
  end
end
