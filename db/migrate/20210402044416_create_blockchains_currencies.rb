class CreateBlockchainsCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :blockchains, :currencies do |t|
      t.string :blockchain_id, index: true
      t.integer :currency_id, index: true
    end
    add_index :blockchains_currencies, %i[blockchain_id currency_id], unique: true
  end
end
