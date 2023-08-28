# frozen_string_literal: true

require_relative '../carrousel'

module Templates
  module Google
    module Carrousel
      module Name
        XPATH = '(./div[last()]/div)[1]'
        SKIP_EMPTY = false
      end
    end
  end
end
