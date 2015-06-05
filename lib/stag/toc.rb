require 'tree'

module Stag
	class TOC
		def initialize
			@root_node = Tree::TreeNode.new("")
		end

		def to_s
			print_tree
		end

    private

    # Most of this grabbed from TreeNode#print_tree. Now returns a (test-friendly) string.
		def print_tree(level = 0, max_depth = nil,
			block = lambda { |node, prefix| "#{prefix} #{node.name}" })

			current_node ||= @root_node
			tree_string ||= ""
			prefix = ''

			if current_node.is_root?
				prefix << '*'
			else
				prefix << '|' unless current_node.parent.is_last_sibling?
				prefix << (' ' * (level - 1) * 4)
				prefix << (current_node.is_last_sibling? ? '+' : '|')
				prefix << '---'
				prefix << (current_node.has_children? ? '+' : '>')
			end

			tree_string << block.call(current_node, prefix)

      # Exit if the max level is defined, and reached.
      return unless max_depth.nil? || level < max_depth

      current_node.children do |child|
				current_node = child
				print_tree(level + 1, max_depth, block) if child
			end

			tree_string
	  end
	end	
end