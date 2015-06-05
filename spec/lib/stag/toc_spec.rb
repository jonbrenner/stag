require_relative "../../spec_helper"

describe Stag::TOC do

	context 'with no content' do

		describe '.to_s' do

			it 'only prints the root' do
				toc = Stag::TOC.new
				expect(toc.to_s).to eq("* ")		  
			end

		end

	end

end