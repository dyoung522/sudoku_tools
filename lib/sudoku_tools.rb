# frozen_string_literal: true

require "thor"

require_relative "sudoku_tools/puzzle"
require_relative "sudoku_tools/version"
require_relative "sudoku_tools/commands/validate"

module SudokuTools
  class Error < StandardError; end

  # CLI command definitions
  class CLI < Thor
    desc "validate", "Validates a completed sudoku puzzle"
    method_option :file, required: true
    def validate
      Commands::Validate.run(options)
    end
  end
end
