# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Admin
      module Entities
        class InternalTransfer < API::V2::Entities::InternalTransfer
          expose(  
            :id,
            documentation: {
              type: Integer,
              desc: 'Internal transfer uniq id'
            }
          )

          expose(
            :currency_id,
            as: :currency,
            documentation: {
              type: String,
              desc: 'The currency code.'
            }
          )
  
          expose(
            :sender_id, ## display UID
            as: :sender,
            documentation: {
              type: String,
              desc: 'The internal transfer sender.'
            }
          )
  
          expose(
            :receiver_id, ## display UID
            as: :receiver,
            documentation: {
              type: String,
              desc: 'The internal transfer receiver.'
            }
          )
  
          expose(
            :direction, ## call method from model
            documentation: {
              type: String,
              desc: 'The internal transfer direction (incoming or outcoming internal transfer).'
            }
          ) do |transfer, options|
            transfer.direction(options[:current_user])
          end
  
          expose(
            :state,
            as: :status,
            documentation: {
              type: String,
              desc: 'The internal transfer state.'
            }
          )
  
          expose(
            :created_at,
            :updated_at,
            format_with: :iso8601,
            documentation: {
              type: String,
              desc: 'The datetimes for the internal transfer.'
            }
          )
        end
      end
    end
  end
end
