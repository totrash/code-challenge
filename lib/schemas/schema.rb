# frozen_string_literal: true

require 'forwardable'
require_relative '../schemas'
require_relative 'config'

module Schemas
  class Schema
    extend Forwardable

    attr_reader :template, :parent_doc, :properties, :items

    def self.build(config, parent_doc)
      type = config['type'] || config['anyOf']&.first&.[]('type')
      const_name = "Schemas::#{Utils.classify(type)}"
      Utils.constantize(const_name).new(config, parent_doc)
    rescue StandardError
      binding.pry
    end

    def initialize(config, parent_doc)
      @config = Schemas::Config.new(config)
      @parent_doc = parent_doc
    end

    def doc
      @parent_doc
    end

    def extract; end

    def_delegators :@config, :type, :template, :properties, :items
  end
end
