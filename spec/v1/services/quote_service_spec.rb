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

    # Edge Case: Empty response from the API
    it 'handles empty quote list response' do
      options = { limit: 1000, offset: 1000, movie: "invalid name" } # Offset and limit unlikely to return data
      response = @quote_service.all(options)
      expect(response).to have_key('docs')
      expect(response['docs']).to eq([])
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

    # Edge Case: Invalid quote ID
    it 'handles invalid quote ID' do
      invalid_id = 'invalid_id'
      response = @quote_service.find(invalid_id)
      expect(response['success']).to eq(false)
    end

    # Edge Case: Non-existent quote ID
    it 'handles non-existent quote ID' do
      non_existent_id = '5cd96e05de30eff6ebcce7z9' # Example of a non-existent ID
      response = @quote_service.find(non_existent_id)
      expect(response['success']).to eq(false)
    end
  end
end