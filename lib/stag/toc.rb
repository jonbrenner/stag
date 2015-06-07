require 'tree'

module Stag
	class TOC
		def initialize
			@root_node = Stag::Entry.new(heading: "")
			self
		end

		def to_s
			@root_node.print_tree
		end

	  def root
			@root_node
		end

	end	
end