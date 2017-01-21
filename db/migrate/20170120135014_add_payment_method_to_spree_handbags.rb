class AddPaymentMethodToSpreeHandbags < ActiveRecord::Migration
  def change
    add_column :spree_handbags, :payment_method, :string
  end
end
