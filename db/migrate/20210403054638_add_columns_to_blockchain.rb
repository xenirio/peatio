class AddColumnsToBlockchain < ActiveRecord::Migration[5.2]
  def change
    add_column :blockchains, :description, :string
    add_column :blockchains, :warning, :string
    add_column :blockchains, :protocol, :string
  end
end
