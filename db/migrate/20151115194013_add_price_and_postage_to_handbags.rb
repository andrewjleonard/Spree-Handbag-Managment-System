class AddPriceAndPostageToHandbags < ActiveRecord::Migration
  def change
  	    add_column :spree_handbags, :price, :decimal, :precision => 8, :scale => 2
  	    add_column :spree_handbags, :postage, :decimal, :precision => 8, :scale => 2
  end
end
