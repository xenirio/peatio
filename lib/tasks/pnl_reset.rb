# frozen_string_literal: true

namespace :pnl do
  desc 'Reset user PnL'
  task reset: :environment do
    Jobs::Cron::StatsMemberPnl.pnl_currencies.each do |pnl_currency|
      Currency.visible.each do |currency|
        StatsMemberPnl.where(currency_id: currency.id, pnl_currency_id: pnl_currency.id) do |pnl|
          member = Member.find(pnl.member_id)
          price = Jobs::Cron::StatsMemberPnl.price_at(pnl.currency_id, pnl.pnl_currency_id, Time.now)
          total_credit = Deposit.where(currency_id: pnl.currency_id, member: member).sum(:amount)
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
        # TODO: update pnl_idx for each currency
      end
    end
  end
end
