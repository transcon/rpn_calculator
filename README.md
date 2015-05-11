# RpnCalculator

Simple equation parser with a reverse polish notation calculator as a backend

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rpn_calculator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rpn_calculator

## Usage

To use as an equation parser and evaluator:

```ruby
    $ RpnCalculator.calculate('1+7-3*16/2**(1+1)') #=> -4
```

To directly access the reverse polish calculator:

```ruby
    $ RpnCalculator.evaluate([[1,7,3,4,5,6],['+','-','*','/','**']]) #=> 4096
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rpn_calculator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


Author
-------

* Chris Moody

License
-------

This is free software released into the public domain.
