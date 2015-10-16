class CreateSpreeMicroposts < ActiveRecord::Migration
  def self.up
    create_table :spree_microposts do |t|
      t.references :user, index: true      
      t.references :handbag, index: true
      t.text :content    
      t.timestamps null: false
    end
      add_index :spree_microposts, [:user_id, :created_at]
      add_foreign_key :spree_microposts, :spree_users, column: :user_id
      add_foreign_key :spree_microposts, :spree_handbags, column: :handbag_id
  end

  def self.down
    drop_table :spree_microposts
  end
end