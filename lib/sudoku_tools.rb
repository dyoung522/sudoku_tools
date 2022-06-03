# frozen_string_literal: true

require "thor"

require_relative "sudoku_tools/puzzle"
require_relative "sudoku_tools/version"
require_relative "sudoku_tools/commands/print"
require_relative "sudoku_tools/commands/validate"

module SudokuTools
  class Error < StandardError; end

  def self.read_matrix(input_file)
    matrix = []

    raise "Unable to read from #{input_file}" unless File.exist? input_file

    File.read(input_file).split.each do |line|
      matrix << line.chars.map(&:to_i) if line =~ /\d{9}/
      matrix << line.split(",").map(&:to_i) if line =~ /\d\s*,\s*\d/
    end

    matrix
  end

  # CLI command definitions
  class CLI < Thor
    desc "validate", "Validates a completed sudoku puzzle"
    method_option :file, required: true
    def validate
      matrix = SudokuTools.read_matrix(options.fetch(:file))
      Commands::Validate.run(matrix:)
    end

    desc "print", "Pretty Prints the given puzzle"
    method_option :file, required: true
    def print
      matrix = SudokuTools.read_matrix(options.fetch(:file))
      Commands::Print.run(matrix:)
    end
  end
end
