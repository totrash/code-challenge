# frozen_string_literal: true

require_relative '../carrousel'

module Templates
  module Google
    module Carrousel
      module ItemWithoutLink
        XPATH = './/div[@jsslot]/div'
        SKIP_EMPTY = false
      end
    end
  end
end
