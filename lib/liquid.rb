require 'uri'
require 'net/http'
require 'time'
require 'jwt'
require 'json'

require_relative "liquid/version"
require_relative "liquid/client"

module Liquid
  def self.new
    Liquid::Client.new
  end
end
