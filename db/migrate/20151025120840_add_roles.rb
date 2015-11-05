class AddRoles < ActiveRecord::Migration
  def change
  	Spree::Role.create :name => "hms-technical"
  	Spree::Role.create :name => "hms-admin"
  end
end
