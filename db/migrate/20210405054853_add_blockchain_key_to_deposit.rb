class AddBlockchainKeyToDeposit < ActiveRecord::Migration[5.2]
  def change
    add_column :deposits, :blockchain_key, :string
  end
end
