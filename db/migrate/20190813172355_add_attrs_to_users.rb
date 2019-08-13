class AddAttrsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :stripe_customer_id, :string
    add_column :users, :paying_customer, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
