require "tree"

module Stag
	class Entry < Tree::TreeNode
		attr_reader :heading

		def initialize( heading: )
			@heading = heading
			super(@heading)
		end

		# Most of this grabbed from TreeNode#print_tree. Now returns a (test-friendly) string.
		def print_tree(level = 0, max_depth = nil, block = lambda { |node, prefix| "#{prefix} #{node.name}" })

			current_node ||= self
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