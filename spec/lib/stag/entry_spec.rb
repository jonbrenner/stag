require_relative "../../spec_helper"

describe Stag::Entry do
	it { is_expected.to have_attributes(heading: nil, link: nil, path: nil)}

  describe '.new( heading: nil, link: nil, path: nil )' do
		it { is_expected.to be_a_kind_of(Tree::TreeNode) }
  end

  describe '<<' do
    it 'should add another Stag::Entry to the Entry subtree' do
      parent = Stag::Entry.new(heading: "ROOT")
      child = Stag::Entry.new(heading: "CHILD")
      parent << child

      expect(parent.children).to include(child)
    end
  end

	describe '.print_tree' do
		it 'prints a text representation of the entry\'s subtree' do
			entry = Stag::Entry.new(heading: "")
			child = Stag::Entry.new(heading: "a child") 
			child << Stag::Entry.new(heading: "a child1")
			child << Stag::Entry.new(heading: "a child2")
			entry << child
			entry << Stag::Entry.new(heading: "a child3")
			
			tree = "☆ \n├───┬ a child\n│   ├──── a child1\n│   └──── a child2\n└──── a child3\n"
			expect{entry.print_tree}.to output(tree).to_stdout
		end

		context 'when an entry has a path' do
		  it 'includes the path in the tree output' do
				entry = Stag::Entry.new(heading: "", path: "a_path.txt")

				expect{entry.print_tree}.to output(/(a_path.txt)/).to_stdout
		  end
		end
	end
end