require 'bundler/setup'
Bundler.setup

require 'pry-byebug'
require 'awesome_print'
require 'json'

require_relative 'lib/schemas/object'
require_relative 'lib/schemas/array'
require_relative 'lib/schemas/string'

require_relative 'lib/templates/google/carrousel'
require_relative 'lib/templates/google/carrousel/name'
require_relative 'lib/templates/google/carrousel/extensions'
require_relative 'lib/templates/google/carrousel/link'
require_relative 'lib/templates/google/carrousel/image'
require_relative 'lib/templates/google/carrousel/item'

require_relative 'lib/parsers/nokogiri'

class Scrapper
  def initialize(file_path, schema)
    @file_path = file_path
    @schema = schema
  end

  def parse
    Parsers::Nokogiri.new(@file_path, @schema).results
  end
end