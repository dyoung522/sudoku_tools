# frozen_string_literal: true

require "test_helper"

class TestSudokuTools < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SudokuTools::VERSION
  end

  def test_validate_command_exists
    assert_instance_of SudokuTools::Commands::Validate, SudokuTools::CLI.new.validate
  end
end
