class AddAgentToHandbag < ActiveRecord::Migration
  def change
    add_column :spree_handbags, :agent, :string
  end
end
