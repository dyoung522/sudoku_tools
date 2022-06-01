# frozen_string_literal: true

module SudokuTools
  module Puzzle
    class Row
      attr_reader :cells

      def initialize(*cells)
        raise ArgumentError, "all cells must be provided" unless cells.length == 9
        raise ArgumentError, "cells must all be from the same row" unless cells.map(&:row).uniq.length == 1

        @cells = cells.flatten
      end

      def number
        @cells.first.row
      end

      def valid?
        @cells.map(&:solution).sum == 45
      end
    end
  end
end
