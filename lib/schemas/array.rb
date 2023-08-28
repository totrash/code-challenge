# frozen_string_literal: true

require_relative 'schema'

module Schemas
  class Array < Schema
    def extract
      @result = []
      if extract_items?
        doc.xpath(template::XPATH).each do |item_doc|
          add(Schema.build(items, item_doc).extract)
        end
      else
        # TODO: remove nokogiri from schema logic
        doc.xpath(template::XPATH).map(&:text)
      end
      @result
    end

    def add(extracted)
      @result << extracted
    end

    private

    def extract_items?
      Utils.present?(items)
    end
  end
end
