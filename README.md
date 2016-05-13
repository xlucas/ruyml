# RUML

Ruby templating using YAML datasources

## Usage

```
Usage : ruml [options]

Mandatory options:
    -d, --datasources DATASOURCES
    -t, --template TEMPLATE

Optional options:
    -o, --output FILE
```

## Example

Given two yaml files :

```yaml
object1:
  propertie: foo
```

```yaml
object2:
  propertie: bar
```

And an erb file :

```erb
message = "<%= object1.propertie.capitalize %> <%= object2.propertie.capitalize %>"
```

Running :

```bash
ruby ruml.rb -d file1.yaml,file2.yaml -t template.erb -o result
```

Gives the following output :

```
message = "Foo Bar"
```

## Status

Alot of todos in there ... but you can feel the spirit.
