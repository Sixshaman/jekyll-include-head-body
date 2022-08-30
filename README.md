# Jekyll Include Head

This Jekyll plugin provides a tag that takes a relative .html file path and returns the contents of the <head> tag.
The intended usage is the same as of include_relative tag. Unlike include_relative, this tag strips out stuff like <!DOCTYPE html> and the <body> tags.

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-include-head"
end
```

And then execute:

    $ bundle

Alternatively install the gem yourself as:

    $ gem install jekyll-include-head

and put this in your ``_config.yml`` 

```yaml
plugins: [jekyll-incude-head]
 # This will require each of these gems automatically.
```

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

## Result

By default the plugin outputs the contents of the <head> tag of the included file.