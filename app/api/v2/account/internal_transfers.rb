# frozen_string_literal: true

module API
  module V2
    module Account
      class InternalTransfers < Grape::API
        namespace :internal_transfers do
          desc 'List your internal transfers as paginated collection.',
               is_array: true,
               success: API::V2::Entities::InternalTransfer
          params do
            optional :currency,
                     type: String,
                     values: { value: -> { Currency.visible.codes(bothcase: true) }, message: 'account.currency.doesnt_exist' },
                     desc: 'Currency code.'
            optional :state, type: String, default: 1, desc: 'The state to filter by.'
            optional :sender
          end

          get do
            user_authorize! :read, ::InternalTransfer
            ransack_params = ::API::V2::Admin::Helpers::RansackBuilder.new(params)
                                                    .eq(:state)
                                                    .translate(currency: :currency_id)
                                                    .build
            search = InternalTransfer.ransack(ransack_params)

            direction = 'in'
            present paginate(search.result), with: API::V2::Entities::InternalTransfer, direction: direction
          end
          desc 'Creates internal transfer.'
          params do
            requires :currency,
                     type: String,
                     values: { value: -> { Currency.visible.codes(bothcase: true) }, message: 'account.currency.doesnt_exist' },
                     desc: 'The currency code.'
            requires :amount,
                     type: { value: BigDecimal, message: 'account.internal_transfer.non_decimal_amount' },
                     values: { value: ->(v) { v.try(:positive?) }, message: 'account.internal_transfer.non_positive_amount' },
                     desc: 'The amount to transfer.'
            requires :otp,
                     type: { value: Integer, message: 'account.internal_transfer.non_integer_otp' },
                     allow_blank: false,
                     desc: 'OTP to perform action'
            optional :username,
                     type: String,
                     allow_blank: false,
                     desc: 'Receiver username.'
            optional :uid,
                     type: String,
                     allow_blank: false,
                     desc: 'The shared receiver ID.'
            optional :limit,
                     type: { value: Integer, message: 'account.internal_transfer.non_integer_limit' },
                     values: { value: 1..100, message: 'account.internal_transfer.invalid_limit' },
                     default: 100,
                     desc: 'Number of withdraws per page (defaults to 100, maximum is 100).'
            optional :page,
                     type: { value: Integer, message: 'account.internal_transfer.non_integer_page' },
                     values: { value: ->(p) { p.try(:positive?) }, message: 'account.internal_transfer.non_positive_page'},
                     default: 1,
                     desc: 'Page number (defaults to 1).'
            exactly_one_of :uid, :username, message: 'account.internal_transfer.one_of_uid_or_username_fields'
          end
          post do
            receiver = if params[:username].present?
                         Member.find_by(username: params[:username])
                       elsif params[:uid].present?
                         Member.find_by(uid: params[:uid])
                       end
            error!({ errors: ['account.internal_transfer.receiver_not_fount'] }, 422) if receiver.nil?
            currency = Currency.find(params[:currency])

            unless Vault::TOTP.validate?(current_user.uid, params[:otp])
              error!({ errors: ['account.internal_tranfer.invalid_otp'] }, 422)
            end

            internal_transfer = ::InternalTransfer.new(
              member: member,
              currency: currency,
              sender_id: current_user.id,
              receiver_id: receiver.id,
              amount: amount
            )
            if internal_transfer.save
              present internal_transfer, with: API::V2::Admin::Entities::InternalTransfer
              status 201
            else
              body errors: internal_transfer.errors.full_messages
              status 422
            end
          end
        end
      end
    end
  end
end
