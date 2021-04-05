class AddBlockchainKeyToWithdraw < ActiveRecord::Migration[5.2]
  def change
    add_column :withdraws, :blockchain_key, :string
  end
end
