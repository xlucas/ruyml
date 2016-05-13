# RUML

Ruby templating using YAML datasources

# Usage

```
Usage : ruml [options]

Mandatory options:
    -d, --datasources DATASOURCES
    -t, --template TEMPLATE

Optional options:
    -o, --output FILE
```

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
ruby ruml.rb -d alert.yaml -t template.erb
```

Gives the following output :

```
message = "Hello world !"
```

### Advanced usage
#### Multiple data sources
You can refer to multiple YAML datasources in a template and render it using :

```bash
ruml -d data1.yaml,data2.yaml -t template.erb
```

#### Accessing Hash methods
When iterating over an item which is not a leaf of the YAML file, you can access
methods of the Hash class directly. In case a propertie has the same name than
the method you are trying to use, simply use the `<method>!` form.

For instance :

```yaml
object:
  each: value
```

```erb
Each object will have <%= object.each %>.

Full object properties:
<% object.each! do |k, v| -%>
  <%= k %> : <%= v %>
<% end -%>
```

Once rendered, the result is :

```
Each object will have value.

Full object properties:
  each : value
```

## Status

Alot of todos in there ... but you can feel the spirit.
