require_relative "../client"

module LotrSDK
  module V1
    class MovieService
      def initialize
        @client = Client.new
      end

      def all
        @client.get('movie')
      end

      def find(id)
        @client.get("movie/#{id}")
      end

      def quotes(id)
        @client.get("movie/#{id}/quote")
      end
    end
  end
end