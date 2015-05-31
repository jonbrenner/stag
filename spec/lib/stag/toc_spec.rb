require_relative "../../spec_helper"

describe Stag::TOC do
	describe '.add_entry(text:, heading_level:, path:)' do
	  toc = Stag::TOC.new
	  toc.add_entry(text: "first heading", heading_level: 1)
	end
end