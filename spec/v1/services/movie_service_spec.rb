require 'spec_helper'
require 'v1/services/movie_service'

RSpec.describe LotrSDK::V1::MovieService do
  before(:all) do
    @movie_service = described_class.new
  end

  describe '#all' do
    it 'retrieves a list of movies with pagination' do
      response = @movie_service.all({ limit: 5, page: 1 })
      expect(response).to have_key('docs')
      expect(response['docs']).to be_an(Array)
    end

    it 'filters movies that won at least one Academy Award' do
      response = @movie_service.all({ "academyAwardWins>" => 0 })
      expect(response).to have_key('docs')
      expect(response['docs'].size).to be > 0
      expect(response['docs']).to all(include('academyAwardWins'))
    end

    it 'filters movies that won have any Academy Award' do
      response = @movie_service.all({ "academyAwardWins <=" => 0 })
      expect(response).to have_key('docs')
      expect(response['docs'].size).to eq(0)
    end

    it 'filters movies by name not equal to a specific value' do
      response = @movie_service.all({ "name!=" => 'The Lord of the Rings Series' })
      expect(response).to have_key('docs')
      expect(response['docs'].size).to be > 0
    end

    it 'filters movies by name equal to a specific value' do
      response = @movie_service.all({ "name" => 'The Lord of the Rings Series' })
      expect(response).to have_key('docs')
      expect(response['docs'].size).to eq(1)
    end

    it 'retrieves movies with combined pagination and filtering' do
      # Combine pagination and filtering options
      options = { limit: 5, page: 1, "academyAwardWins>" => 0 }
      response = @movie_service.all(options)

      # Check the response has the expected structure
      expect(response).to have_key('docs')
      expect(response['docs']).to be_an(Array)

      # Validate the number of movies returned is within the expected range
      expect(response['docs'].size).to be > 0

      # Ensure that each movie in the response has won at least one Academy Award
      expect(response['docs']).to all(include('academyAwardWins'))
    end

    # Edge Case: Empty response from the API
    it 'handles empty movie list response' do
      options = { limit: 1000, page: 1000 } # Page and limit unlikely to return data
      response = @movie_service.all(options)
      expect(response).to have_key('docs')
      expect(response['docs']).to eq([])
    end
  end

  describe '#find' do
    it 'retrieves a specific movie by ID' do
      movie_id = '5cd95395de30eff6ebccde5b' # Example ID
      response = @movie_service.find(movie_id)
      expect(response).to have_key('docs')
      expect(response['docs'].first['_id']).to eq(movie_id)
    end

    # Edge Case: Invalid movie ID
    it 'handles invalid movie ID' do
      invalid_id = 'invalid_id'
      response = @movie_service.find(invalid_id)
      expect(response['success']).to eq(false)
    end

    # Edge Case: Non-existent movie ID
    it 'handles non-existent movie ID' do
      non_existent_id = '5cd95395de30eff6ebccde5z'
      response = @movie_service.find(non_existent_id)
      expect(response['success']).to eq(false)
    end
  end

  describe '#quotes' do
    it 'retrieves quotes for a specific movie with pagination' do
      movie_id = '5cd95395de30eff6ebccde5b' # Example ID
      response = @movie_service.quotes(movie_id, { limit: 5, page: 1 })
      expect(response).to have_key('docs')
      expect(response['docs']).to be_an(Array)
    end
  end
end