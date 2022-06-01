# frozen_string_literal: true

require "test_helper"

module SudokuTools
  module Commands
    class TestValidate < Minitest::Test
      def test_validate_command_exists
        assert_instance_of SudokuTools::Commands::Validate, SudokuTools::CLI.new.validate
      end
    end
  end
end
