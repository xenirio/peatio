class AddBlockchainKeyToPaymentAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_addresses, :blockchain_key, :string
  end
end
