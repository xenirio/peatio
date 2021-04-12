# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Entities
      class Blockchain < API::V2::Entities::Base
        expose(
          :key,
          documentation: {
            type: String,
            desc: 'Unique key to identify blockchain.'
          }
        )

        expose(
          :name,
          documentation: {
            type: String,
            desc: 'A name to identify blockchain.'
          }
        )

        expose(
          :explorer_address,
          documentation: {
            type: String,
            desc: 'Blockchain explorer address template.'
          }
        )

        expose(
          :explorer_transaction,
          documentation: {
            type: String,
            desc: 'Blockchain explorer transaction template.'
          }
        )

        expose(
          :min_confirmations,
          documentation: {
            type: Integer,
            desc: 'Minimum number of confirmations.'
          }
        )

        expose(
          :status,
          documentation: {
            type: String,
            desc: 'Blockchain status (active/disabled).'
          }
        )

        expose(
          :description,
          documentation: {
            type: String,
            desc: 'Blockchain description.'
          }
        )

        expose(
          :protocol,
          documentation: {
            type: String,
            desc: 'Blockchain protocol.'
          }
        )

        expose(
          :warning,
          documentation: {
            type: String,
            desc: 'Blockchain warning.'
          }
        )

        expose(
          :created_at,
          format_with: :iso8601,
          documentation: {
            type: String,
            desc: 'Blockchain created time in iso8601 format.'
          }
        )

        expose(
          :updated_at,
          format_with: :iso8601,
          documentation: {
            type: String,
            desc: 'Blockchain updated time in iso8601 format.'
          }
        )
      end
    end
  end
end
