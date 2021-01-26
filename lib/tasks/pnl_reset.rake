# frozen_string_literal: true

namespace :pnl do
  desc 'Reset users PnL'
  task reset: :environment do
    Jobs::Cron::StatsMemberPnl.pnl_currencies.each do |pnl_currency|
      ActiveRecord::Base.transaction do
        Currency.visible.each do |currency|
          StatsMemberPnl.where(currency_id: currency.id, pnl_currency_id: pnl_currency.id).each do |pnl|
            member = Member.find(pnl.member_id)
            account = member.get_account(currency.id)

            price = Jobs::Cron::StatsMemberPnl.price_at(pnl.currency_id, pnl.pnl_currency_id, Time.now)
            total_credit = account.balance + account.locked
            total_credit_value = total_credit * price

            pnl.update!(
              total_credit: total_credit,
              total_credit_fees: 0,
              total_debit: 0,
              total_debit_fees: 0,
              total_credit_value: total_credit_value,
              total_debit_value: 0,
              total_balance_value: total_credit_value,
              average_balance_price: total_credit_value
            )
          end

          insert_latest_data_for_pnl_idx(pnl_currency, currency.id)
        end
      end
    end
  end
end


def insert_latest_data_for_pnl_idx(pnl_currency, currency_id)
  # Ids should be greater than reset time
  adjustment_idx = withdraw_idx = deposit_fiat_idx  = deposit_coin_idx = (Time.now.to_f * 1000).to_i + 1
  trade_idx = Trade.last&.id
  transfer_idx = Transfer.last&.id

  # Insert into stats_member_pnl_idx last values
  Jobs::Cron::StatsMemberPnl.build_query_idx(pnl_currency, currency_id, 'Adjustment', adjustment_idx) if adjustment_idx
  Jobs::Cron::StatsMemberPnl.build_query_idx(pnl_currency, currency_id, 'DepositFiat', deposit_fiat_idx) if deposit_fiat_idx
  Jobs::Cron::StatsMemberPnl.build_query_idx(pnl_currency, currency_id, 'DepositCoin', deposit_coin_idx) if deposit_coin_idx
  Jobs::Cron::StatsMemberPnl.build_query_idx(pnl_currency, currency_id, 'Trade', trade_idx) if trade_idx
  Jobs::Cron::StatsMemberPnl.build_query_idx(pnl_currency, currency_id, 'Withdraw', withdraw_idx) if withdraw_idx
  Jobs::Cron::StatsMemberPnl.build_query_idx(pnl_currency, currency_id, 'Transfer', transfer_idx) if transfer_idx
end
