# HashAtPath

Provides a simple xpath-like syntax for retrieving values from a hash.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_at_path'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_at_path

## Usage

Paths are delimited with forward slashes and predicates are enclosed by brackets:

```
> {'foo' => ['bar', 'baz']}.at_path('/')
{'foo' => ['bar', 'baz']}
> {'foo' => {'bar' => [{'baz' => 'bam'}, {'baz' => 'jam'}, {'baz' => ['ham']}]}}.at_path('foo/bar[*]/baz')
["bam", "jam", ["ham"]]
> {'foo' => ['bar', 'baz']}.at_path('foo[1]')
'baz'
> {'foo' => ['bar', 'baz', 'barn']}.at_path('foo[-1]')
'barn'
> {'foo' => ['bar', 'baz']}.at_path('foo[last()]')
'baz'
> {'foo' => ['bar', 'baz']}.at_path('foo[first()]')
'bar'
> {'foo' => ['bar', 'baz']}.at_path('WAT')
nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/chadfennell/hash_at_path/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
