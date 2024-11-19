require_relative "../client"

module LotrSDK
  module V1
    class QuoteService
      def initialize
        @client = Client.new
      end

      def all(options = {})
        @client.get('quote', options)
      end

      def find(id)
        @client.get("quote/#{id}")
      end
    end
  end
end