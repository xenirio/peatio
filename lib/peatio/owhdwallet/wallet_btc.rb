module OWHDWallet
  class WalletBTC < WalletAbstract
    def coin_type
      'btc'
    end

    def token_name
      'omni'
    end

    def eth_like?
      false
    end
  end
end
