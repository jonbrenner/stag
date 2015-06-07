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