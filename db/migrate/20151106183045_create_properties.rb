class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :no
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
