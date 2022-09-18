# Jekyll Include Head

This Jekyll plugin provides a Liquid tag that takes a relative path to .html file path and returns the contents of the \<head\> tag.
The intended usage is the same as of include_relative tag. Unlike include_relative, this tag strips out stuff like \<!DOCTYPE html\> and the \<body\> tags.

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-include-head", :git => "https://github.com/Sixshaman/jekyll-include-head/"
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

</body>
</html>
```

## Result

By default the plugin outputs the contents of the \<head\> tag of the specified file.
