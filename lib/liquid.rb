require_relative "liquid/version"

module Liquid
  class Error < StandardError; end
  def self.hello
    pp Liquid::VERSION
  end
end

Liquid.hello