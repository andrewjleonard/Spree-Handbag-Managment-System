class AddPictureToSpreeHandbags < ActiveRecord::Migration
  def change
    add_column :spree_handbags, :picture, :string
  end
end
