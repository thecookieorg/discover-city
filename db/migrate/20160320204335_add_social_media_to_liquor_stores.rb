class AddSocialMediaToLiquorStores < ActiveRecord::Migration
  def change
    add_column :liquor_stores, :facebook, :string
    add_column :liquor_stores, :twitter, :string
    add_column :liquor_stores, :instagram, :string
  end
end
