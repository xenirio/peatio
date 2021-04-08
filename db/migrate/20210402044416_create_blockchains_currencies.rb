class CreateBlockchainsCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :blockchains, :currencies do |t|
      t.index :blockchain_id
      t.index :currency_id
    end
    change_column :blockchains_currencies, :currency_id, :string
  end
end
