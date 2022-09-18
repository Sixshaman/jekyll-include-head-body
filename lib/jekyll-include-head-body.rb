require "jekyll"
require "nokogiri"
require "jekyll-include-head-body/version"

class IncludeHeadBody < Liquid::Tag
  def initialize(tagName, content, tokens)
    super
    @content = content.strip
  end

  def render_path(context, path)
    curr_dir = context.environments.first['page']['dir']

    #Remove "/" at the start and the end of curr_dir
    curr_dir.gsub!(/^\/+/, "")
    curr_dir.gsub!(/\/+$/, "")

    file_contents = File.read(curr_dir + "/" + @content)
    parsed_html = Nokogiri::HTML.parse(file_contents)

    parsed_html.xpath(path)
  end

end

class IncludeHead < IncludeHeadBody
  def render(context)
    render_path(context, "/html/head")
  end

  Liquid::Template.register_tag "include_head", self
end

class IncludeBody < IncludeHeadBody
  def render(context)
    render_path(context, "/html/body")
  end

  Liquid::Template.register_tag "include_body", self
end
