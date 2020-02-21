# A Ruby CLI Noughts and Crosses Game
[![Build Status](https://travis-ci.com/teenie-quaggard/ruby-knots-and-crosses.svg?branch=master)](https://travis-ci.com/teenie-quaggard/ruby-knots-and-crosses)

The goal of this project is to:
- Develop experience in working in an object oriented language (Ruby)
- Develop experience implementing the SOLID principles
- Practice test driven development
- Create classes as small as possible

## Initial acceptance criteria 
1. Create a walking skeleton
2. Create a 3x3 CLI Noughts and Crosses game with two human players - 'X' & 'O'
3. Winning or tie games should be identified gracefully after game ends

## What I've learned
1. Using ```bundle gem [project_name]```, it is best for the project name to be separated with hyphens (eg. ```this-is-a-project-name```), as this will nest a number of folders within the lib folder
2. Gemfile is the equivalent of a package.json in Javascript
3. .to output.to_stdout tests for output to console
4. Time box design thinking for these early projects 
5. Be careful about getting sucked into deep refactoring. Perhaps try to attempt completing functionality first. 

## What I've struggled with

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'game'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install game

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/teenie-quaggard/ruby-knots-and-crosses.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
