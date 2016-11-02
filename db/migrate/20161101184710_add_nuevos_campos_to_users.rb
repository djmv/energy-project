class AddNuevosCamposToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :costo_kw, :float
    add_column :users, :estrato, :string
  end
end
