# 🎢 Tiqets

A simple (unofficial) Ruby wrapper for the [Tiqets](https://www.tiqets.com) [API](https://api.tiqets.com/v2/docs/).

[![Travis CI status](https://img.shields.io/travis/richardvenneman/tiqets.svg?style=flat-square)](https://travis-ci.org/richardvenneman/tiqets)
[![RubyGem](https://img.shields.io/gem/v/tiqets.svg?style=flat-square)](https://rubygems.org/gems/tiqets)
[![Code Climate](https://img.shields.io/codeclimate/github/richardvenneman/tiqets.svg?style=flat-square)](https://codeclimate.com/github/richardvenneman/tiqets)
[![Code Climate](https://img.shields.io/codeclimate/coverage/github/richardvenneman/tiqets.svg?style=flat-square)](https://codeclimate.com/github/richardvenneman/tiqets/coverage)

Full 100% API coverage is not a direct goal as we're primarily developing this for our needs at [CitySpotters](https://www.cityspotters.com). Pull requests are definitely welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tiqets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tiqets

## Usage

You must be in possession of a Tiqets API key. Use this key to initialize a new API client:

```ruby
@client = Tiqets::Client.new(api_key: 'my-api-key')
```

Alternatively you can set the `TIQETS_API_KEY` environment variable and use the shared API instance with:

```ruby
@client = Tiqets.default_api
```

### Products

#### Get a single product
Finds a product by Product ID. Returns an object with the properties [described in the API documentation](https://api.tiqets.com/v2/docs/#the-product-object).

```ruby
@client.find_product(973698)
# => #<Tiqets::Resources::Product::Product:0x007fe9c8438a00>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/richardvenneman/tiqets.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
