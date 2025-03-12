class AddCvIdToEducations < ActiveRecord::Migration[7.1]
  def change
    add_column :educations, :cv_id, :integer
    add_index :educations, :cv_id
  end
end
