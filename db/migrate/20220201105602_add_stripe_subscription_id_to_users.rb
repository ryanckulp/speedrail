class AddStripeSubscriptionIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :stripe_subscription_id, :string
  end
end
