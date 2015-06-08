module Stag
	module Filter

		class Markdown
			attr_reader :headings

			def initialize(file)
				@headings = []

				parse file
			end

			private

			def parse(file)
				file.each_line do |line|
					look_for_heading line
				end
			end

			def look_for_heading(line)
				@headings << line.chomp if line =~ /^#+ /
			end

		end

	end
end
