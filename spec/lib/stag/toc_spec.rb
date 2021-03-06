require_relative "../../spec_helper"

describe Stag::TOC do

	describe '.new' do
		it 'initializes a TOC with a root node' do
			toc = Stag::TOC.new
		  expect(toc.root).to be_a_kind_of(Stag::Entry)
		end
	end

	describe '.root' do
		it 'returns the root node' do
		  toc = Stag::TOC.new
		  expect(toc.root).to be_a_kind_of(Stag::Entry)
		end
	end

	describe '.to_s' do
		it 'prints a text representation of the TOC' do
			expect{Stag::TOC.new.to_s}.to output("☆ \n").to_stdout
		end
	end

end