# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Public
      class MemberLevels < Grape::API
        desc 'Returns hash of minimum levels and the privileges they provide.'
        get '/member-levels' do
          { deposit: { minimum_level: Peatio::App.config.minimum_member_level_for_deposit.to_i },
            withdraw: { minimum_level: Peatio::App.config.minimum_member_level_for_withdraw.to_i },
            trading: { minimum_level: Peatio::App.config.minimum_member_level_for_trading.to_i } }
        end
      end
    end
  end
end
