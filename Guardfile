# frozen_string_literal: true

# guard :rubocop do
#   watch(/.+\.rb$/)
#   watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
# end

guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/(.*)/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { "test" }
end
