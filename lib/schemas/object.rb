require_relative 'schema'

module Schemas
  class Object < Schema
    def extract
      @result = {}
      properties.each do |name, config|        
        extract_child(config) do |extracted, template|         
          add(name, extracted, template)
        end        
      end      
      @result
    end

    def add(name, extracted, template)
      return if template && template::SKIP_EMPTY && Utils.blank?(extracted)
      @result[name] = extracted
    end    

    def extract_child(config)          
      schema = Schema.build(config, doc)
      yield schema.extract, schema.template
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