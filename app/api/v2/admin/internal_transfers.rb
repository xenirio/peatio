# frozen_string_literal: true

module API
  module V2
    module Admin
      class InternalTransfers < Grape::API
        helpers ::API::V2::Admin::Helpers

        desc 'Get all internal transfers.',
             is_array: true,
             success: API::V2::Admin::Entities::InternalTransfer
        params do
          optional :sender_uid,
            values:  { value: -> (v) { Member.exists?(uid: v) }, message: 'admin.sender.doesnt_exist' },
            desc: -> { API::V2::Entities::Member.documentation[:uid][:desc] }
          optional :receiver_uid,
            values:  { value: -> (v) { Member.exists?(uid: v) }, message: 'admin.receiver.doesnt_exist' },
            desc: -> { API::V2::Entities::Member.documentation[:uid][:desc] }
          use :currency
          use :pagination
          use :date_picker
          use :ordering
        end
        get '/internal_transfers' do
          admin_authorize! :read, InternalTransfer

          if params[:sender_uid].present?
            sender = Member.find_by(uid: params[:sender_uid])
            params.except!(:sender_uid).merge!(sender_id: sender.id) if sender.present?
          end

          if params[:receiver_uid].present?
            receiver = Member.find_by(uid: params[:receiver_uid])
            params.except!(:receiver_uid).merge!(receiver_id: receiver.id) if receiver.present?
          end

          ransack_params = Helpers::RansackBuilder.new(params)
                             .eq(:sender_id, :receiver_id)
                             .translate_in(currency: :currency_id)
                             .with_daterange
                             .build

          search = ::InternalTransfer.ransack(ransack_params)
          search.sorts = "#{params[:order_by]} #{params[:ordering]}"

          present paginate(search.result), with: API::V2::Admin::Entities::InternalTransfer
        end
      end
    end
  end
end
