class RenameUserIdToProfileIdInEducations < ActiveRecord::Migration[7.1]
  def change
    # Renames the 'user_id' column to 'profile_id'
    rename_column :educations, :user_id, :profile_id

        # Optionally, add a foreign key constraint (if needed)
    add_foreign_key :educations, :profiles, column: :profile_id

  end
end
