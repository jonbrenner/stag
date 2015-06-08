require_relative "../../../spec_helper.rb"

describe Stag::Filter::Markdown do
	let(:normal_markdown_file) {File.new(RSpec.configuration.fixtures_path + "/normal_markdown.md")}

  describe '.headings' do
    it 'should return a collection of headings' do
      md = Stag::Filter::Markdown.new(normal_markdown_file)
      expect(md.headings).to eq([
				"# 1 this is the first heading",
				"## 1.1 h2 heading",
				"### 1.1.1 h3 heading"
				])
    end
  end
end
