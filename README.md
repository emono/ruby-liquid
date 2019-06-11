[![Gem Version](https://badge.fury.io/rb/ruby-liquid.svg)](https://badge.fury.io/rb/ruby-liquid)
[![Build Status](https://travis-ci.org/emono/ruby-liquid.svg?branch=master)](https://rubygems.org/gems/ruby-liquid)
[![download](https://img.shields.io/gem/dt/ruby-liquid.svg)](https://rubygems.org/gems/ruby-liquid)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

# Liquid

Crypto Exchange Liquid Ruby Api Client
- [Api Document](https://developers.liquid.com/#introduction)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-liquid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-liquid

## Usage
```rb
require 'ruby-liquid'
liquid_client = Liquid::Client.new(token: token, secret: secret)
pair = "BTCJPY"
liquid_client.product
liquid_client.product_id(pair)
liquid_client.orders
liquid_client.active_orders
liquid_client.balance
liquid_client.limit_buy_price(pair)
liquid_client.limit_sell_price(pair)
liquid_client.create_order(pair: pair, side: 'buy', quantity: 0.01, price: 40000)
liquid_client.cancel_order(id)
```

## Contributing

Fork it ( https://github.com/emono/ruby-liquid )
Create your feature branch (git checkout -b my-new-feature)
Commit your changes (git commit -am 'Add some feature')
Push to the branch (git push origin my-new-feature)
Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Donation
- [BTC]address: 1JXN9W2M3UDVKmUtKg8J643JLRrf8HmRzK
- [ETH]address: 0x3dccb7efdd5a961e7731f511b8dc09a09616d6eb
- [XRP]address: rNQEMJA4PsoSrZRn9J6RajAYhcDzzhf8ok tag: 1000000006
- [MONA]address: PAjK9cMqLrrkDr5rDvPqFwkXVHBZkKgjYF

