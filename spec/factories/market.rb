# encoding: UTF-8
# frozen_string_literal: true

FactoryBot.define do
  factory :market do
    engine { create(:engine) }
    trait :btcusd do
      market_name       { 'btcusd' }
      market_type       { 'spot' }
      base_currency     { 'btc' }
      quote_currency    { 'usd' }
      amount_precision  { 8 }
      price_precision   { 2 }
      min_price         { 0.01 }
      min_amount        { 0.00000001 }
      position          { 1 }
      state             { :enabled }
    end

    trait :btceth do
      market_name       { 'btceth' }
      market_type       { 'spot' }
      base_currency     { 'btc' }
      quote_currency    { 'eth' }
      amount_precision  { 4 }
      price_precision   { 6 }
      min_price         { 0.000001 }
      min_amount        { 0.0001 }
      position          { 2 }
      state             { :enabled }
    end

    trait :btceur do
      market_name       { 'btceur' }
      market_type       { 'spot' }
      base_currency     { 'btc' }
      quote_currency    { 'eur' }
      amount_precision  { 8 }
      price_precision   { 2 }
      min_price         { 0.01 }
      min_amount        { 0.00000001 }
      position          { 3 }
      state             { :enabled }
    end

    trait :ethusd do
      market_name       { 'ethusd' }
      market_type       { 'spot' }
      base_currency     { 'eth' }
      quote_currency    { 'usd' }
      amount_precision  { 6 }
      price_precision   { 4 }
      min_price         { 0.01 }
      min_amount        { 0.0001 }
      position          { 4 }
      state             { :enabled }
    end

    trait :btctrst do
      market_name       { 'btctrst' }
      market_type       { 'spot' }
      base_currency     { 'btc' }
      quote_currency    { 'trst' }
      amount_precision  { 6 }
      price_precision   { 4 }
      min_price         { 0.01 }
      min_amount        { 0.0001 }
      position          { 5 }
      state             { :enabled }
    end

    trait :xagm_cxusd do
      market_name       { 'xagm.cxusd' }
      market_type       { 'spot' }
      base_currency     { 'xagm.cx' }
      quote_currency    { 'usd' }
      amount_precision  { 6 }
      price_precision   { 4 }
      min_price         { 0.01 }
      min_amount        { 0.0001 }
      position          { 4 }
      state             { :enabled }
    end

    trait :btceth_qe do
      market_name       { 'btceth' }
      market_type       { 'qe' }
      base_currency     { 'btc' }
      quote_currency    { 'eth' }
      amount_precision  { 4 }
      price_precision   { 6 }
      min_price         { 0.000001 }
      min_amount        { 0.0001 }
      position          { 2 }
      state             { :enabled }
    end
  end
end
