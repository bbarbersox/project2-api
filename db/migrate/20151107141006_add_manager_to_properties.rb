class AddManagerToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :manager, :string
  end
end
