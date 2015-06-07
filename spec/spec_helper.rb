require_relative '../lib/stag'

require 'rspec'
require "stringio"

FIXTURES_PATH = File.join(Dir.pwd, "spec", "fixtures")

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # # This makes sublime text output ugly
  # # Use color not only in STDOUT but also in pagers and files
  # config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate 
end

def capture_stdout
  # The output stream must be an IO-like object. In this case we capture it in
  # an in-memory IO object so we can return the string value. You can assign any
  # IO object here.
  previous_stdout, $stdout = $stdout, StringIO.new
  yield
  $stdout.string
ensure
  # Restore the previous value of stdout (typically equal to STDOUT).
  $stdout = previous_stdout
end
