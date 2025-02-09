class CreateStyles < ActiveRecord::Migration[7.1]
  def change
    create_table :styles do |t|
      t.string :name
      t.string :font_family
      t.string :heading_color
      t.string :text_color
      t.integer :font_size

      t.timestamps
    end
  end
end
