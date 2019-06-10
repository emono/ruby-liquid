[![Gem Version](https://badge.fury.io/rb/ruby-liquid.svg)](https://badge.fury.io/rb/ruby-liquid)
[![Build Status](https://travis-ci.org/emono/ruby-liquid.svg?branch=master)](https://rubygems.org/gems/ruby-liquid)
[![download](https://img.shields.io/gem/dt/ruby-liquid.svg)](https://rubygems.org/gems/ruby-liquid)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

# Liquid

Crypto exchange (liquid) api client

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
# get
liquid_client.product
liquid_client.product_id("BCHJPY")
liquid_client.orders
liquid_client.balance
# post
liquid_client.create_order(pair: "BCHJPY", side: 'buy', quantity: 0.01, price: 40000)
```

## Contributing

wip

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

