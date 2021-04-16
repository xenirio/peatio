module OWHDWallet
  class WalletETH < WalletAbstract
    def default_fees
      { eth_gas_limit: 21_000, erc20_gas_limit: 90_000, gas_price: :standard }.freeze
    end

    def coin_type
      'eth'
    end

    def token_name
      'erc20'
    end

    def eth_like?
      true
    end
  end
end
