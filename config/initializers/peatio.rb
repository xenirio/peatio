# frozen_string_literal: true
require 'peatio/app'

Peatio::App.define do |config|
	# Minimum member level configurations
	config.set(:minimum_member_level_for_deposit, 3, type: :integer)
	config.set(:minimum_member_level_for_withdraw, 3, type: :integer)
	config.set(:minimum_member_level_for_trading, 3,type: :integer)

	# to check
	config.set(:enable_account_withdrawal_api, true, type: :bool)
  config.set(:order_max_age, 2_419_200, type: :integer)
	config.set(:aml_backend)
	config.set(:withdraw_admin_approve)


	config.set(:matching_engine, 'peatio')
	config.set(:rate_limit_5min, 6000, type: :integer)
	config.set(:accept_minutes, 30, type: :integer)

	config.set(:max_markets, '')
	config.set(:max_currencies, '')

	# Vault configuration
	config.set(:vault_addr, 'http://127.0.0.1:8200')
	config.set(:vault_token, '')
	config.set(:vault_app_name, 'peatio')

	# PNL configuration
	config.set(:pnl_currencies, '')
	config.set(:pnl_conversion_paths, '')
	config.set(:pnl_exclude_roles, '')

  # RabbitMQ configuration
	config.set(:event_api_rabbitmq_url, '')
	config.set(:event_api_rabbitmq_host, 'localhost')
	config.set(:event_api_rabbitmq_port, '5672')
	config.set(:event_api_rabbitmq_username, 'guest')
	config.set(:event_api_rabbitmq_password, 'guest')

	# Event API configuration
	config.set(:event_api_jwt_private_key, '')
	config.set(:event_api_jwt_algorithm, 'RS256')
end