require 'uri'
require 'net/http'
require 'time'
require 'jwt'

require_relative "liquid/version"
require_relative "liquid/client"

module Liquid
  def self.new(token, secret)
    Liquid::Client.new(token, secret)
  end
end
