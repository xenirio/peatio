# frozen_string_literal: true

class AddMarketType < ActiveRecord::Migration[5.2]
  def change
    # Change Markets table
    add_column :markets, :market_type, :string, default: 'spot', null: false, after: 'id'
    remove_index(:markets, column: %i[base_unit quote_unit], name: 'index_markets_on_base_unit_and_quote_unit')
    add_index(:markets, %i[id market_type], unique: true)
    add_index(:markets, %i[base_unit quote_unit market_type], unique: true)
    execute "ALTER TABLE `markets` DROP PRIMARY KEY"

    # # Change Orders table
    # add_column :orders, :market_type, :string, default: 'spot', null: false, after: 'market_id'
    # remove_index(:orders, column: %i[type market_id])
    # remove_index(:orders, column: %i[type member_id])
    # remove_index(:orders, column: %i[type state market_id])
    # remove_index(:orders, column: %i[type state member_id])
    # add_index(:orders, %i[type market_id market_type])
    # add_index(:orders, %i[type member_id market_type])
    # add_index(:orders, %i[type state market_id market_type])
    # add_index(:orders, %i[type state member_id market_type])
    #
    # # Change Trades table
    # add_column :trades, :market_type, :string, default: 'spot', null: false, after: 'market_id'
    # remove_index(:trades, column: %i[market_id created_at])
    # add_index(:orders, %i[market_id market_type created_at])
    #
    # # Change TradingFees table
    # add_column :trading_fees, :market_type, :string, default: 'spot', null: false, after: 'market_id'
    # remove_index(:trading_fees, column: %i[market_id group])
    # remove_index(:trading_fees, column: :market_id)
    # add_index(:trading_fees, %i[market_id market_type group])
    # add_index(:trading_fees, %i[market_id market_type])
  end
end
