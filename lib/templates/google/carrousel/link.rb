# frozen_string_literal: true

require_relative '../carrousel'

module Templates
  module Google
    module Carrousel
      module Link
        SKIP_EMPTY = false

        def attribute
          'href'
        end

        def format(value)
          "https://www.google.com#{value}" if Utils.present?(value)
        end

        module_function :attribute, :format
      end
    end
  end
end
