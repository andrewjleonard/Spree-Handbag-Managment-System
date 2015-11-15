class AddPhoneAndNameToUsers < ActiveRecord::Migration
  def change
  	add_column :spree_users, :name, :string
  	add_column :spree_users, :phone, :string
  end
end
