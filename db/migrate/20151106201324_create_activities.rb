class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :nanme
      t.string :provider
      t.string :prono
      t.string :prostreet
      t.string :procity
      t.string :prostate
      t.integer :zip
      t.string :dov
      t.string :tov
      t.integer :length
      t.string :participant

      t.timestamps null: false
    end
  end
end
