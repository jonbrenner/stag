require "tree"

module Stag
	class Entry < Tree::TreeNode
		attr_reader :heading, :path, :link

		def initialize( heading: nil, path: nil, link: nil )
			@heading = heading
			@path = path
			@link = link
			super(self.__id__.to_s)
		end

		# Pretty prints the (sub)tree rooted at this node.
    #
    # @param [Integer] level The indentation level (4 spaces) to start with.
    def print_tree(level = 0)
      line = ''
      if is_root?
        line << '☆'
      else
        line << '│' unless parent.is_last_sibling?
        line << (' ' * (level - 1) * 3)
        line << (is_last_sibling? ? '└' : '├')
        line << '───'
        line << (has_children? ? '┬' : '─')
      end

      line << " #{heading}" if heading
      line << " (#{path})" if path
      puts line 

      children { |child| child.print_tree(level + 1) if child } # Child might be 'nil'
      return
    end
  end
end