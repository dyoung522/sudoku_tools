# frozen_string_literal: true

require "thor"

require_relative "sudoku_tools/version"
require_relative "sudoku_tools/commands/validate"

module SudokuTools
  class Error < StandardError; end

  # CLI command definitions
  class CLI < Thor
    desc "Validate a puzzle", "Validates a completed sudoku puzzle"
    def validate
      Commands::Validate.new
    end
  end
end
