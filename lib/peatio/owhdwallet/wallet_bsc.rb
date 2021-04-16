module OWHDWallet
  class WalletBSC < WalletAbstract
    def default_fees
      { bsc_gas_limit: 21_000, bep20_gas_limit: 90_000, gas_price: :standard }.freeze
    end

    def coin_type
      'bsc'
    end

    def token_name
      'bep20'
    end

    def eth_like?
      true
    end

    def wallet_gateway_url
      @wallet.fetch(:gateway_url) || default_wallet_gateway_url
    end

    def default_wallet_gateway_url
      if testnet?
        'https://data-seed-prebsc-1-s1.binance.org:8545/'
      else
        'https://bsc-dataseed.binance.org/'
      end
    end

    def testnet?
      @wallet.fetch(:testnet)
    end
  end
end
