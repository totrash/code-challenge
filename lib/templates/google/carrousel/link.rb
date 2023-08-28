require_relative '../carrousel'

module Templates::Google::Carrousel::Link
  SKIP_EMPTY = false

  def attribute
    'href'
  end

  def format(value)
    "https://www.google.com#{value}" if Utils.present?(value)
  end

  module_function :attribute, :format
end