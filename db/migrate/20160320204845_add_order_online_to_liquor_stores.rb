class AddOrderOnlineToLiquorStores < ActiveRecord::Migration
  def change
    add_column :liquor_stores, :order_online, :string
  end
end
