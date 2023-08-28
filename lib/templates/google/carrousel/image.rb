require 'base64'
require 'net/http'
require 'uri'
require_relative '../carrousel'

module Templates::Google::Carrousel::Image
  XPATH = "(.//img)[1]"
  SKIP_EMPTY = false

  def attribute
    'data-key'
  end

  def format(value)
    return if Utils.blank?(value)

    url = URI.parse(value)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    request = Net::HTTP::Get.new("#{url.path}?#{url.query}")
    response = http.request(request)
    if response.code == '200'
      image_data = response.body      
      "data:image/jpeg;base64,#{Base64.encode64(image_data).gsub("\n", '').gsub('=', 'x3d')}"
    else
      puts "Error: #{response.code} - #{response.message}"
    end
  end

  module_function :attribute, :format
end