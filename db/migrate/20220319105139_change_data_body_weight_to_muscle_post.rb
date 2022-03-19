class ChangeDataBodyWeightToMusclePost < ActiveRecord::Migration[6.1]
  def change
     change_column :muscle_posts,:body_weight,:float
  end
end
