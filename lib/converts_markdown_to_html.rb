require 'kso_markdown'

class ConvertsMarkdownToHTML
  attr_reader :content

  def self.convert(input)
    converter = new(input)
    converter.convert
    converter.content
  end

  def initialize(input)
    @content = (input || "").dup
  end

  def convert
    convert_markdown_to_html
    sanitize_html
  end

  private

  def sanitize_html
    @content = Loofah.fragment(@content).scrub!(:escape).to_s
  end

  def convert_markdown_to_html
    @content = KSOMarkdown.render(@content)
  end
end
