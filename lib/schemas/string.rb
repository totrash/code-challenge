# frozen_string_literal: true

require_relative 'schema'

module Schemas
  class String < Schema
    ## TODO remove nokogiri parsing from schema
    def extract
      if template.respond_to?(:attribute)
        value = doc[template.attribute]
        template.respond_to?(:format) ? template.format(value) : value
      else
        doc.text
      end
    end

    def doc
      @doc ||= if template && Module.const_defined?("#{template.name}::XPATH")
                 @parent_doc.xpath(template::XPATH).first
               else
                 @parent_doc
               end
    end
  end
end
