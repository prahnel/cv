class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :institution
      t.string :degree
      t.text :summary

      t.timestamps
    end
  end
end
