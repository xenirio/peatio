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
              desc: 'The internal transfer id.'
            }
          )
          expose(
            :type,
            documentation: {
              type: String,
              desc: 'Internal transfer type.'
            }
          )
        end
      end
    end
  end
end
