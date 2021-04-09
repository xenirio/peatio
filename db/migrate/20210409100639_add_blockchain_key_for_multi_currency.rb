class AddBlockchainKeyForMultiCurrency < ActiveRecord::Migration[5.2]
  def change
    add_column :blockchains, :description, :string
    add_column :blockchains, :warning, :string
    add_column :blockchains, :protocol, :string
    add_column :deposits, :blockchain_key, :string
    add_column :withdraws, :blockchain_key, :string
    add_column :payment_addresses, :blockchain_key, :string
    # For existing payment address
    PaymentAddress.all.each { |payment| payment.update(blockchain_key: payment.wallet.blockchain_key) }
  end
end
