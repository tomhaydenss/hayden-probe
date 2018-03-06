# Hayden::Probe

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hayden/probe`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hayden-probe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hayden-probe

## Usage

You should start this application by creating a surface that will be explored by probes. You should inform the number of columns represented by the argument X and the number of rows represented by the argument Y. In the following example a surface with 5 columns and 5 rows will be created.

    $ bundle exec bin/hayden-probe surface -x=5 -y=5
    
    A surface with 5 rows and 5 lines has been created
    
The next step is to inform the probe's position represented by coordinates X and Y and also by direction that means for which side the probe is facing to (north, south, east or weast). 

    Please, inform the probe's position and direction
    Coordinate X: 1
    Coordinate Y: 2
    Direction (N/S/E/W): N
    
Now you should inform the movements sequence that the probe will do. Just follow the instructions and give these information.
    
    Please, inform the sequence of movements that the probe should do
    Ex: If you wish the probe to turn Left, Move forward, turn Left again, Move forward twice
    You should type the following sequence: LMLMM
    Movements alloweds are M = Move forward, L = Turn Left and R = Turn Right
    Movements sequence: LMLMLMLMM
    Result: 1 3 N
    
If you desire to add another probe, so type 'y' for the following question and fill the next probe's information.
    
    Do you want to add another probe (y/n)? y
    Please, inform the probe positions and direction
    Coordinate X: 3
    Coordinate Y: 3
    Direction (N/S/E/W): E    
    Please, inform the sequence of movements that the probe should do
    Ex: If you wish the probe to turn Left, Move forward, turn Left again, Move forward twice
    You should type the following sequence: LMLMM
    Movements alloweds: M = Move forward, L = Turn Left, R = Turn Right
    Movements sequence: MMRMMRMRRM
    Result: 5 1 E
    Do you want to add another probe (y/n)? n
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

This is a ruby solution for the [following challenge](https://gist.github.com/pahagon/0c8d7c5664c335fbe3e4211ea82ad8cc).

Bug reports and pull requests are welcome on GitHub at https://github.com/tomhaydenss/hayden-probe.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
