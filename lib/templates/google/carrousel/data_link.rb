require_relative '../carrousel'

module Templates::Google::Carrousel::DataLink
  SKIP_EMPTY = false

  def attribute
    'data-lpage'
  end

  module_function :attribute
end