require "jekyll"
require "nokogiri"
require "jekyll-include-head/version"
class IncludeHead < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content.strip
  end

  def change_relative_src(html_node, new_relative_path)
    if html_node.class.method_defined? "attributes"
      html_node.attributes.each do |attr_name, attr_info|
        if attr_name == "src" || attr_name == "href"
          unless attr_info.content.start_with?("http://") || attr_info.content.start_with?("https://")
            attr_info.content = new_relative_path + attr_info.content
          end
        end
      end
    end

    if html_node.class.method_defined? "children"
      for child_node in html_node.children
        change_relative_src(child_node, new_relative_path)
      end
    end
  end

  def render(context)
    curr_dir = context.environments.first['page']['dir']

    #Remove "/" at the start and the end of curr_dir
    curr_dir.gsub!(/^\/+/, "")
    curr_dir.gsub!(/\/+$/, "")

    file_contents = File.read(curr_dir + "/" + @content)
    parsed_html = Nokogiri::HTML.parse(file_contents)

    head_contents = parsed_html.xpath("/html/head")

    #Replace "href" and "src" attributes with new relative path
    relative_path = @content[0..@content.rindex("/")]
    change_relative_src(head_contents, relative_path)

    head_contents
  end

  Liquid::Template.register_tag "include_head", self
end
