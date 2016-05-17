# RUYML

Ruby templating using YAML datasources

# Usage

## Library

```ruby
  require 'ruyml'
  require 'yaml'

  content = YAML.load(File.read("file.yml"))
  r = Ruyml::Data.new(content)
  r.render("template.erb", "output.txt")
```

## CLI

## Simple usage

Given a yaml file :

```yaml
alert:
  message: 'hello world !'
```

And an erb file :

```erb
message = "<%= alert.message.capitalize %>"
```

Running :

```bash
ruyml -d alert.yaml -t template.erb
```

Gives the following output :

```
message = "Hello world !"
```

## Advanced usage
### Multiple data sources
You can refer to multiple YAML datasources in a template and render it using :

```bash
ruyml -d data1.yaml,data2.yaml -t template.erb
```

### Accessing Hash methods
When iterating over an item which is not a leaf of the YAML file, you can access
methods of the Hash class directly. In case a propertie has the same name than
the method you are trying to use, simply use the `<method>!` form.

For instance :

```yaml
object:
  each:
    - attr1: val1
    - attr2: val2
    - attr3: val3
```

```erb
Object dump :
<%= object.each %>

Object attributes:
<% object.each! do |p, items| -%>
  <% items.each do |attr, val| -%>
    Attribute <%= attr %> has value <%= val %>
  <% end -%>
<% end -%>
```
