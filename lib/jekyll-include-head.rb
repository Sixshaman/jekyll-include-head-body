require "jekyll"
require "nokogiri"
require "jekyll-include-head/version"
class IncludeHead < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content.strip
  end

  def render(context)
    curr_dir = context.environments.first['page']['dir']
    if(curr_dir.start_with?("/"))
      curr_dir.gsub!(/^\/+/, "")
    end

    file_contents = File.read(curr_dir + "/" + @content)
    parsed_html = Nokogiri::HTML.parse(file_contents)

    parsed_html.xpath("/html/head")
  end

  Liquid::Template.register_tag "include_head", self
end
