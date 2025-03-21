class ChangeWorkExperiences < ActiveRecord::Migration[7.1]
  def change
    remove_column :work_experiences, :details, :text
    add_column :work_experiences, :company, :string
    add_column :work_experiences, :position, :string
  end
end
