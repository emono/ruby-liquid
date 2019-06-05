require 'uri'
require 'net/http'
require 'time'
require 'jwt'
require 'json'
require 'pry'

require_relative "liquid/version"
require_relative "liquid/client"

module Liquid
  def self.new(token: nil, secret: nil)
    Liquid::Client.new(token, secret)
  end
end
