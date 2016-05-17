require "ruyml/version"

require 'erb'

module Ruyml

  class Data
    # Create RUYML data from a YAML hash.
    # Underlying hashes will be accessed
    # as instances of this class. Other
    # types are kept untouched and returned
    # as is.
    def initialize(hash)
      @hash = hash
      @hash.each do |k, v|
        self.define_singleton_method k.to_sym do
          return v.class == Hash ? Data.new(v) : v
        end
      end
    end

    # Renders RUYML data using the given template.
    # Rendered data is either written to an optional
    # output file path or to stdout.
    def render(template, output)
      result = ERB.new(File.read(template), 0, '-').result(binding)
      if !output.nil?
        File.open(output, "w") do |file|
          file.write(result)
        end
      else
        puts result
      end
    end

    # Access Hash class methods. If a YAML propertie
    # matches the method name, then the target method
    # is called if a '!' terminates the method name.
    private
    def method_missing(name, *args, &block)
      method = name.to_s
      if method =~ /.+!$/ && self.respond_to?(method.chop)
        method.chop!
      end
      if @hash.respond_to?(method)
        @hash.send(method, *args, &block)
      else
        raise NameError, "Undefined property or method '#{name}'"
      end
    end
  end

end
