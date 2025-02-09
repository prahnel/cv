class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.string :education
      t.string :string
      t.text :address
      t.text :summary

      t.timestamps
    end
  end
end
