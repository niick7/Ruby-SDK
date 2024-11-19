require_relative "../client"

module LotrSDK
  module V1
    # Service to interact with the Quote API
    class QuoteService
      # Initializes the QuoteService
      def initialize
        @client = Client.new
      end

      # Fetches all quotes with optional filters and pagination
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
      def all(options = {})
        @client.get('quote', options)
      end

      # Fetches details of a specific quote by ID
      # @param quote_id [String] The ID of the quote
      # @return [Hash] The details of the quote
      # @example Example Response
      #   {
      #     "docs": [
      #       {
      #         "_id": "5cd96e05de30eff6ebcce7e9",
      #         "dialog": "Even the smallest person can change the course of the future.",
      #         "movie": "5cd95395de30eff6ebccde5b",
      #         "character": "5cd99d4bde30eff6ebccfc15"
      #       }
      #     ]
      #   }
      def find(id)
        @client.get("quote/#{id}")
      end
    end
  end
end