class AddLogoToLiquorStores < ActiveRecord::Migration
  def change
    add_column :liquor_stores, :logo, :string
  end
end
