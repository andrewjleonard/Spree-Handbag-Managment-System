class CreateSpreeHandbags < ActiveRecord::Migration
  def self.up
    create_table :spree_handbags do |t|
      t.string :make
      t.string :colour
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_handbags
  end
end
