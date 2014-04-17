# Flap

tap + instance_eval

## Installation

Add this line to your application's Gemfile:

    gem 'flap'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flap

## Usage

```ruby
require "flap"

hash = {a: 1, b: 2}

# w/o flap
ret = hash.dup.tap {|h| h.delete(:a) }

p hash #=> {:a => 1, :b => 2}
p ret #=> {:b => 2}

# w/ flap
ret = hash.dup.flap { delete :a }

p hash #=> {:a => 1, :b => 2}
p ret #=> {:b => 2}
```

## Contributing

1. Fork it ( http://github.com/hekk/flap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
