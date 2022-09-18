# Jekyll Include Head

This Jekyll plugin provides two Liquid tags that take a relative path to .html file path.
- The tag {% include_head %} returns the contents of the \<head\> HTML tag.
- The tag {% include_body %} returns the contents of the \<body\> HTML tag.
The intended usage is the same as of {% include_relative %} tag. Unlike {% include_relative %}, these tag strip out stuff like \<!DOCTYPE html\>. 
Also, {% include_relative %} often breaks the page layout by putting the whole page contents into \<body\> section. These tags do not do that.

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-include-head-body", :git => "https://github.com/Sixshaman/jekyll-include-head-body/"
end
```

And then execute:

    $ bundle install

## Usage

```
<html>
<head>
  {% include_head file.html %}
</head>
<body>
  {% include_body file.html %}
</body>
</html>
```

Usage with relative paths is a bit more complicated:
```
<html>
<head>
  <base href="{{ site.url }}{{ page.url }}/">
  {% include_head src/file.html %}
</head>
<body>
  {% include_body src/file.html %}
</body>
</html>
```

## Result

By default the plugin outputs the contents of the corresponding HTML section of the specified file.