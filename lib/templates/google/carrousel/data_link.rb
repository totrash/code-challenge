# frozen_string_literal: true

require_relative '../carrousel'

module Templates
  module Google
    module Carrousel
      module DataLink
        SKIP_EMPTY = false

        def attribute
          'data-lpage'
        end

        module_function :attribute
      end
    end
  end
end
