require 'spec_helper'
require 'v1/services/quote_service'

RSpec.describe LotrSDK::V1::QuoteService do
  before(:all) do
    @quote_service = described_class.new
  end

  describe '#all' do
    it 'retrieves quotes with combined pagination and filtering' do
      # Combine pagination and filtering options
      options = { limit: 10, offset: 5, character: '5cd99d4bde30eff6ebccfc15' } # Example character ID
      response = @quote_service.all(options)

      # Check the response has the expected structure
      expect(response).to have_key('docs')
      expect(response['docs']).to be_an(Array)

      # Validate the number of quotes returned is within the expected range
      expect(response['docs'].size).to be <= 10

      # Ensure that each quote in the response has the correct character ID
      expect(response['docs']).to all(include('character'))
      expect(response['docs']).to all(satisfy { |quote| quote['character'] == '5cd99d4bde30eff6ebccfc15' })
    end
  end

  describe '#find' do
    it 'retrieves the details of a specific quote by ID' do
      quote_id = '5cd96e05de30eff6ebcce7e9' # Example quote ID
      response = @quote_service.find(quote_id)

      # Check the response has the expected structure
      expect(response).to have_key('docs')
      expect(response['docs']).to be_an(Array)
      expect(response['docs'].first).to include('_id' => quote_id)

      # Validate that the quote details are correct
      expect(response['docs'].first).to include('dialog')
      expect(response['docs'].first).to include('character')
    end
  end
end