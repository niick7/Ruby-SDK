require_relative "../client"

module LotrSDK
  module V1
    class MovieService
      def initialize
        @client = Client.new
      end

      def all(options = {})
        @client.get('movie', options)
      end

      def find(id)
        @client.get("movie/#{id}")
      end

      def quotes(id, options = {})
        @client.get("movie/#{id}/quote", options)
      end
    end
  end
end