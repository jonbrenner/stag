require_relative "../../spec_helper"

describe Stag::Entry do
  
  describe '.new( heading: nil, link: nil, path: nil )' do
		it { is_expected.to be_a_kind_of(Tree::TreeNode) }
		it { is_expected.to have_attributes(heading: nil, link: nil, path: nil)}
  end

  describe '.heading' do
    it 'should get the entry\'s heading' do
      entry = Stag::Entry.new(heading: "some heading")

      expect(entry.heading).to eq("some heading")
    end
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
			
			captured_output = capture_stdout { entry.print_tree }	
			
			expect(captured_output).to eq("☆ \n├───┬ a child\n│   ├──── a child1\n│   └──── a child2\n└──── a child3\n")		  
		end

		context 'when an entry has a path' do
		  it 'includes the path in the tree output' do
				entry = Stag::Entry.new(heading: "", path: "a_path.txt")

				captured_output = capture_stdout { entry.print_tree }	

				expect(captured_output).to match(/(a_path.txt)/)
		  end
		end
	end
end