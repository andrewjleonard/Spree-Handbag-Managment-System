class AddBooleansToSpreeHandbags < ActiveRecord::Migration
  def change
    add_column :spree_handbags, :trade, :boolean
    add_column :spree_handbags, :two_week_turnaround, :boolean
    add_column :spree_handbags, :returned_bag, :boolean
    add_column :spree_handbags, :is_quality_controlled, :boolean
  end
end
