class RemoveColumnsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :email, :string
    remove_column :users, :name, :string
    remove_column :users, :address, :string
    remove_column :users, :phone, :string
    remove_column :users, :LinkedIn, :string
    remove_column :users, :GitHub, :string
  end
end
