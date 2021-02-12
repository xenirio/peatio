require 'peatio/upstream/opendax'
require 'peatio/irix/huobi'
require 'peatio/irix/bitfinex'

Peatio::Upstream.registry[:opendax] = Peatio::Upstream::Opendax
Peatio::Upstream.registry[:bitfinex] = Irix::Bitfinex
Peatio::Upstream.registry[:huobi] = Irix::Huobi
