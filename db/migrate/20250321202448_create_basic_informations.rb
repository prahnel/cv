class CreateBasicInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :basic_informations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.text :linkedin
      t.text :github
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
