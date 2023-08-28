# frozen_string_literal: true

require 'json-schema'

describe 'extract google results artworks' do
  describe 'extract van-gogh artworks paintings' do
    before :all do
      @schema = {
        'type' => 'object',
        'template' => Templates::Google::Carrousel,
        'properties' => {
          'artworks' => {
            'template' => Templates::Google::Carrousel::Item,
            'type' => 'array',
            'items' => {
              'type' => 'object',
              'properties' => {
                'image' => {
                  'template' => Templates::Google::Carrousel::Image,
                  'anyOf' => [
                    { 'type' => 'string' },
                    { 'type' => 'null' }
                  ]
                }
              }
            }
          }
        }
      }
      @file_path = File.join(File.expand_path('..', __dir__), 'files', 'picasso-paintings.html')
      @result_file_path = File.join(File.expand_path('..', __dir__), 'files', 'picasso-expected.json')
      @results = Scrapper.new(@file_path, @schema).parse
    end

    it 'returns valid json schema' do
      valid_json = JSON::Validator.validate(@schema, @results)
      expect(valid_json).to be_truthy
    end

    it 'returns valid json data' do
      @expected_results = JSON.parse(File.read(@result_file_path))
      expect(@results).to eq(@expected_results)
    end
  end
end
