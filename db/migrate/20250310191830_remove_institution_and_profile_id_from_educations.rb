class RemoveInstitutionAndProfileIdFromEducations < ActiveRecord::Migration[7.1]
  def change
    remove_column :educations, :profile_id, :integer
  end
end
