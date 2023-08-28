require_relative '../carrousel'

module Templates
  module Google
    module Carrousel
      module Extensions        
        XPATH = '(./div[last()]/div)[position() > 1]'
        SKIP_EMPTY = true
      end
    end
  end
end