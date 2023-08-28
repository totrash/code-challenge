# frozen_string_literal: true

require 'nokogiri'
require_relative 'parser'

module Parsers
  class Nokogiri < Parser
    def results
      Schemas::Schema.build(@schema_config, doc).extract
    end

    def doc
      @doc ||= File.open(@file_path) { |f| ::Nokogiri::HTML(f, nil, Encoding::UTF_8.to_s) }
    end
  end
end
