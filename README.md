# AssertSqlite

Store [Assert](https://github.com/redding/assert) test run data and result data in a [sqlite](https://www.sqlite.org/) db.

## Why should I use this?

The idea is to relieve memory pressure and get some performance gains when running large test suites.  The test suite needs to be sufficiently so that
the gains from not keeping this data in memory outweight the overhead of storing/fetching the data from sqlite.

TODO: give some rough estimates of what suite sizes this starts to benefit

## Usage

AssertSqlite provides custom suite that stores test run data and result data in a sqlite db instead of in memory.  In your [assert configuration](https://github.com/redding/assert#configuring-assert) specify the AssertSqlite suite
object:

```ruby
require 'assert-sqlite'
AssertSqlite.init
```

Other than that, just use Assert as you normally would.

## Installation

Add this line to your application's Gemfile:

    gem 'assert-sqlite'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install assert-sqlite

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
