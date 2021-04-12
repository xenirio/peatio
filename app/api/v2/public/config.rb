# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Public
      class Config < Grape::API
        get '/config' do
          present currencies: Currency.all, with: Entities::Currency,
                  blockchains: Blockchain.all, with: Entities::Blockchain,
                  trading_fees: TradingFee.all, with: Entities::TradingFee,
                  markets: ::Market.all, with: Entities::Market,
                  withdraw_limits: WithdrawLimit.all, with: Entities::WithdrawLimit
        end
      end
    end
  end
end

