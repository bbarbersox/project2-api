class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :activities, :nanme, :name
  end
end
