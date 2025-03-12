class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.references :cv, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :summary
      t.text :details

      t.timestamps
    end
  end
end
