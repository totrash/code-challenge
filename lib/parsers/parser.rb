# frozen_string_literal: true

require_relative '../parsers'
require_relative '../schemas/schema'
require_relative '../schemas/config'

module Parsers
  class Parser
    extend Forwardable

    def initialize(file_path, schema_config)
      @file_path = file_path
      @schema_config = schema_config
    end

    def results
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def_delegators :@schema_config, :type, :template, :properties, :items
  end
end
