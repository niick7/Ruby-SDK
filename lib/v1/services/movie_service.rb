require_relative "../client"

module LotrSDK
  module V1
    # Service to interact with the Movie API
    class MovieService
      # Initializes the MovieService
      def initialize
        @client = Client.new
      end

      # Fetches all movies with optional filters and pagination
      # @param options [Hash] Options for filtering and pagination (e.g., { limit: 5, page: 1 })
      # @return [Hash] The response from the API
      # @example Example Response
      #   {
      #     "docs": [
      #       {
      #         "_id": "5cd95395de30eff6ebccde5b",
      #         "name": "The Two Towers",
      #         "runtimeInMinutes": 179,
      #         "budgetInMillions": 94,
      #         "boxOfficeRevenueInMillions": 926,
      #         "academyAwardNominations": 6,
      #         "academyAwardWins": 2,
      #         "rottenTomatoesScore": 96
      #       }
      #     ],
      #     "total": 8,
      #     "limit": 5,
      #     "page": 1,
      #     "pages": 2
      #   }
      def all(options = {})
        @client.get('movie', options)
      end

      # Fetches details of a specific movie by ID
      # @param movie_id [String] The ID of the movie
      # @return [Hash] The details of the movie
      # @example Example Response
      #   {
      #     "docs": [
      #       {
      #         "_id": "5cd95395de30eff6ebccde5b",
      #         "name": "The Two Towers",
      #         "runtimeInMinutes": 179,
      #         "budgetInMillions": 94,
      #         "boxOfficeRevenueInMillions": 926,
      #         "academyAwardNominations": 6,
      #         "academyAwardWins": 2,
      #         "rottenTomatoesScore": 96
      #       }
      #     ]
      #   }
      def find(id)
        @client.get("movie/#{id}")
      end

      # Fetches quotes from a specific movie by ID with optional filters and pagination
      # @param movie_id [String] The ID of the movie
      # @param options [Hash] Options for filtering and pagination (e.g., { limit: 5, page: 1 })
      # @return [Hash] The response from the API
      # @example Example Response
      #   {
      #     "docs": [
      #       {
      #         "_id": "5cd96e05de30eff6ebcce7e9",
      #         "dialog": "Even the smallest person can change the course of the future.",
      #         "movie": "5cd95395de30eff6ebccde5b",
      #         "character": "5cd99d4bde30eff6ebccfc15"
      #       }
      #     ],
      #     "total": 1,
      #     "limit": 5,
      #     "page": 1,
      #     "pages": 1
      #   }
      def quotes(id, options = {})
        @client.get("movie/#{id}/quote", options)
      end
    end
  end
end