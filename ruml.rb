#!/usr/bin/env ruby

# *****************************************************************************
#  RUML : Ruby templating using YAML datasources
# *****************************************************************************
#  @author : Xavier Lucas
# *****************************************************************************

require 'erb'
require 'yaml'


class Item

  def initialize(hash)
    @hash = hash
    @hash.each do |k, v|
      self.define_singleton_method k.to_sym do
        return v.class == Hash ? Item.new(v) : v
      end
    end
  end

  def render(template)
    puts ERB.new(File.read(template)).result(binding)
  end

end


Item.new(YAML.load(File.read(ARGV[0]))).render(ARGV[1])
