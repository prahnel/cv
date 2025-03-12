class CreateCvs < ActiveRecord::Migration[7.1]
  def change
    create_table :cvs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :skills

      t.timestamps
    end
  end
end
