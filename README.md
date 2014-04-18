# Flap

[![Build Status](https://travis-ci.org/hekk/flap.png?branch=master)](https://travis-ci.org/hekk/flap)
[![Code Climate](https://codeclimate.com/github/hekk/flap.png)](https://codeclimate.com/github/hekk/flap)
[![Gem Version](https://badge.fury.io/rb/flap.png)](http://badge.fury.io/rb/flap)

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
ret = hash.dup.instance_eval_tap { delete :a }

p hash #=> {:a => 1, :b => 2}
p ret #=> {:b => 2}
```

You can also use short version of methods.

```ruby
Flap.enable_short_methods!

hash = {a: 1}
hash.itap { delete :a } #=> {}
```

## Contributing

1. Fork it ( http://github.com/hekk/flap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
