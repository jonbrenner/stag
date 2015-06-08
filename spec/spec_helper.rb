require_relative '../lib/stag'

require 'rspec'
require "stringio"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # # This makes sublime text output ugly
  # # Use color not only in STDOUT but also in pagers and files
  # config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate 

  # My Stuff
  config.add_setting :fixtures_path

  config.fixtures_path = File.expand_path("fixtures", __dir__)
end