# frozen_string_literal: true

module API
  module V2
    module Admin
      class InternalTransfers < Grape::API
        helpers ::API::V2::Admin::Helpers

        desc 'Get internal_transfer by ID.',
             success: API::V2::Admin::Entities::InternalTransfer
        params do
          requires :id,
                   type: { value: Integer, message: 'admin.internal_transfer.non_integer_id' },
                   desc: -> { API::V2::Admin::Entities::InternalTransfer.documentation[:id][:desc] }
        end
        get '/internal_transfers/:id' do
          admin_authorize! :read, InternalTransfer

          internal_transfer = InternalTransfer.find!(params[:id])
          present internal_transfer, with: API::V2::Admin::Entities::InternalTransfer
        end
      end
    end
  end
end
