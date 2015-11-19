class AddRoles < ActiveRecord::Migration
  def change
  	Spree::Role.find_or_create_by(name: "hms-technical")
  	Spree::Role.find_or_create_by(name: "hms-admin")
  end
end
