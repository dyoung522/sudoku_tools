# frozen_string_literal: true

require "terminal-table"

module SudokuTools
  module Commands
    class Print
      attr_reader :table

      def self.run(opts)
        puts new(opts).table.render
      end

      def initialize(opts)
        @table = Terminal::Table.new do |t|
          t.rows = opts.fetch(:matrix)
          t.style = { all_separators: true }
        end
      end
    end
  end
end
