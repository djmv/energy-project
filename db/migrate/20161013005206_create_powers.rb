class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.float :value

      t.timestamps null: false
    end
  end
end
