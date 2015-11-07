class AddHouseMgmtCoToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :house_mgmt_co, :string
  end
end
