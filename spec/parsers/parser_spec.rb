describe Parsers::Nokogiri do
  before :all do
    @file_path = File.join(File.expand_path('../..', __dir__), 'files', 'van-gogh-paintings.html')
    @parser = Parsers::Nokogiri.new(@file_path, {})
  end

  describe '#doc' do
    it 'returns nokogiri document' do
      expect(@parser.doc).to be_a(Nokogiri::HTML4::Document)
    end

    it 'parses document title' do      
      expect(@parser.doc.title).to eq("Van Gogh paintings - Google Search")
    end
  end

  describe '#results' do
    it 'calls schema builder' do      
      expect(Schemas::Schema).to receive(:build)
        .with({}, @parser.doc)
        .and_return(instance_double(Schemas::Schema, extract: nil))

      @parser.results
    end
  end
end