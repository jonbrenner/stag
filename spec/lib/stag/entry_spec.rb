require_relative "../../spec_helper"

describe Stag::Entry do
  
  describe '.new( heading: )' do
    it 'initializes a kind of TreeNode' do
      expect( Stag::Entry.new(heading: "some heading") ).to be_a_kind_of(Tree::TreeNode)
    end
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
			entry = Stag::Entry.new(heading: "ROOT")
			expect(entry.print_tree).to eq("* ROOT")		  
		end
	end
end