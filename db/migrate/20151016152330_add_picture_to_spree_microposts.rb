class AddPictureToSpreeMicroposts < ActiveRecord::Migration
  def change
    add_column :spree_microposts, :picture, :string
  end
end
