class AddPayingCustomerToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :paying_customer, :boolean, default: false
  end
end
