# SudokuTools

This is a toolbox for Sudoku puzzles.

## Installation

    $ gem install sudoku_tools

## Usage

To use:

    $ sudoku --file filename <command>

When necessary, the tool will read a text file containing 9 lines of numbers, where each line represents a row in your puzzle. Use `0` to indicate blank entries.

### Available Commands

- `validate`: Validates a given puzzle
- `solve`: Solves a given puzzle (_coming soon_)
- `create`: Creates a new and valid puzzle (_coming soon_)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dyoung522/sudoku_tools.
