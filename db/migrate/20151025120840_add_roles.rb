class AddRoles < ActiveRecord::Migration
  def change
  	Spree::Role.create :name => "technical"
  end
end
