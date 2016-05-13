#!/usr/bin/env ruby

# *****************************************************************************
#  RUML : Ruby templating using YAML datasources
# *****************************************************************************
#  @author : Xavier Lucas
# *****************************************************************************

require 'erb'
require 'yaml'
require 'optparse'
require 'ostruct'


class Item
  def initialize(hash)
    @hash = hash
    @hash.each do |k, v|
      self.define_singleton_method k.to_sym do
        return v.class == Hash ? Item.new(v) : v
      end
    end
  end

  def render(template, output)
    result = ERB.new(File.read(template)).result(binding)
    if !output.nil?
      File.open(output, "w") do |file|
        file.write(result)
      end
    else
      puts result
    end
  end
end

# Parse CLI
data = {}
options = OpenStruct.new
parser = OptionParser.new do |opts|
  opts.banner = "Usage : #{File.basename($0)} [options]"
  opts.separator ""
  opts.separator "Mandatory options:"

  opts.on("-d", "--datasources DATASOURCES", Array) do |datasources|
    options.datasources = datasources
  end

  opts.on("-t", "--template TEMPLATE") do |template|
    options.template = template
  end

  opts.separator ""
  opts.separator "Optional options:"

  opts.on("-o", "--output FILE") do |output|
    options.output = output
  end
end

parser.parse!(ARGV)

if options.template.nil? || options.datasources.nil?
  abort parser.help
end

options.datasources.each do |datasource|
  data.merge!(YAML.load(File.read(datasource)))
end

Item.new(data).render(options.template, options.output)
