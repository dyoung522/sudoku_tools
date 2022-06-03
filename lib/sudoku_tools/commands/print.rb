# frozen_string_literal: true

require "tty-table"

module SudokuTools
  module Commands
    class Print
      attr_reader :table

      def self.run(opts)
        renderer = TTY::Table::Renderer::Unicode.new(new(opts).table)

        renderer.padding = [0, 1]
        renderer.border.separator = :each_row
        renderer.border.style = :blue
        renderer.filter = ->(val, _row, _col) { val.to_i.zero? ? "" : val }

        puts renderer.render
      end

      def initialize(opts)
        @table = TTY::Table.new rows: opts.fetch(:matrix)
      end
    end
  end
end
