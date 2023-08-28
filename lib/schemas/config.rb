# frozen_string_literal: true

module Schemas
  class Config
    def initialize(config)
      @config = config
    end

    def type
      @config['type']
    end

    def template
      @config['template']
    end

    def properties
      @config['properties']
    end

    def items
      @config['items']
    end
  end
end
