# RUML

Ruby templating using YAML datasources

## Usage

Given a yaml file :

```yaml
foo:
  bar: 'hello world !'
```

And an erb file :

```erb
message = "<%= foo.bar.capitalize %>"
```

Running :

```bash
ruby ruml.rb datasource.yaml template.erb
```

Gives the following output :

```
message = "Hello world !"
```

## Status

Alot of todos in there ... but you can feel the spirit.
