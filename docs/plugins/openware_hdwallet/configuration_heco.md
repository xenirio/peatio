# Openware HDWallet plugin - Huobi HECO Chain

This peatio plugin is using the openware HDWallet microservice to generate users wallets, sign and broadcast transactions.

This plugin with openware HDWallet supports HT native currency and HRC20 tokens on Huobi HECO chain.

#### 

## Blockchain configuration

You need to create a blockchain entry in peatio before configuring wallets. 
Blockchains can be configured through Tower in `Settings > Blockchains` section.

#### Testnet configuration

| Key                  | Value                                           |
| -------------------- | ----------------------------------------------- |
| Name                 | Heco Testnet                                    |
| Client               | geth-heco                                       |
| Server               | https://http-testnet.hecochain.com              |
| Min confirmations    | 1                                               |
| Key                  | heco-testnet                                    |
| Explorer address     | https://testnet.hecoinfo.com/address/#{address} |
| Explorer transaction | https://testnet.hecoinfo.com/tx/#{txid}         |

#### Mainnet configuration

| Key                  | Value                                   |
| -------------------- | --------------------------------------- |
| Name                 | Heco Mainnet                            |
| Client               | geth-heco                               |
| Server               | https://http-mainnet.hecochain.com      |
| Min confirmations    | 20                                      |
| Key                  | heco-mainnet                            |
| Explorer address     | https://hecoinfo.com/address/#{address} |
| Explorer transaction | https://hecoinfo.com/tx/#{txid}         |



## Wallets configuration

Wallets can be configured through Tower in `Settings > Wallets` section.

### Deposit wallet

| Key                 | Value                              | Description                                                  |
| ------------------- | ---------------------------------- | ------------------------------------------------------------ |
| Name                | HT/HRC20 Deposit Wallet            |                                                              |
| Status              | Active                             | Enable the wallet                                            |
| Blockchain key      | heco-mainnet                       | Blockchain key configured before (*heco-testnet* for testnet) |
| Gateway Client      | https://http-mainnet.hecochain.com | RPC REST of blockchain node (https://http-testnet.hecochain.com for testnet) |
| Address             | -                                  | The address of the deposit wallet is not used for HECO blockchain. |
| Kind                | deposit                            | Configure this wallet as a deposit wallet.                   |
| Maximum balance     | 0.0                                | Unused for deposit wallets.                                  |
| URI (in properties) | https://hdwallet/api/v2/hdwallet   | URL of the openware HDWallet microservice                    |

Example from the console:

```ruby
Wallet.create!(
  blockchain_key: "heco-mainnet",
  name: "HT/HRC20 Deposit Wallet",
  address: "-",
  gateway: "ow-hdwallet-heco",
  kind: "deposit",
  settings: {uri: "https://hdwallet/api/v2/hdwallet", gateway_url: "https://http-mainnet.hecochain.com"},
  max_balance: 0,
  currency_ids: ["ht"],
  status: "active"
)
```

### Hot wallet

| Key                 | Value                              | Description                                                  |
| ------------------- | ---------------------------------- | ------------------------------------------------------------ |
| Name                | HT/HRC20 Hot Wallet                |                                                              |
| Status              | Active                             | Enable the wallet                                            |
| Blockchain key      | heco-mainnet                       | Blockchain key configured before (*heco-testnet* for testnet) |
| Gateway Client      | https://http-mainnet.hecochain.com | RPC REST of blockchain node (https://http-testnet.hecochain.com for testnet) |
| Address             |                                    | Leave the address empty for peatio to generate it automatically. |
| Kind                | hot                                | Configure this wallet as a hot wallet.                       |
| Maximum balance     | 10000                              | Once this amount reached, deposits will be collected to **warm** and **cold** wallets. |
| URI (in properties) | https://hdwallet/api/v2/hdwallet   | URL of the openware HDWallet microservice                    |

Example from the console:

```ruby
Wallet.create!(
  blockchain_key: "heco-mainnet",
  name: "HT/HRC20 Hot Wallet",
  address: "",
  gateway: "ow-hdwallet-heco",
  kind: "hot",
  settings: {uri: "https://hdwallet/api/v2/hdwallet", gateway_url: "https://http-mainnet.hecochain.com"},
  max_balance: 10000,
  currency_ids: ["ht"],
  status: "active"
)
```



### Fee wallet

| Key                 | Value                              | Description                                                  |
| ------------------- | ---------------------------------- | ------------------------------------------------------------ |
| Name                | HT/HRC20 Fee Wallet                |                                                              |
| Status              | Active                             | Enable the wallet                                            |
| Blockchain key      | heco-mainnet                       | Blockchain key configured before (*heco-testnet* for testnet) |
| Gateway Client      | https://http-mainnet.hecochain.com | RPC REST of blockchain node (https://http-testnet.hecochain.com for testnet) |
| Address             |                                    | Leave the address empty for peatio to generate it automatically. |
| Kind                | fee                                | Configure this wallet as a hot wallet.                       |
| Maximum balance     |                                    |                                                              |
| URI (in properties) | https://hdwallet/api/v2/hdwallet   | URL of the openware HDWallet microservice                    |

Example from the console:

```ruby
Wallet.create!(
  name: "HT/HRC20 Fee Wallet",
  blockchain_key: "heco-mainnet",
  address: "",
  gateway: "ow-hdwallet-heco",
  kind: "hot",
  settings: {uri: "https://hdwallet/api/v2/hdwallet", gateway_url: "https://http-mainnet.hecochain.com"},
  max_balance: 10000,
  currency_ids: ["ht"],
  status: "active"
)
```
