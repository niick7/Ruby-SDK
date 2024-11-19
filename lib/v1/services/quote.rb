require_relative "../client"

module LotrSDK
  module V1
    class QuoteService
      def initialize
        @client = Client.new
      end

      def all
        @client.get('quote')
      end

      def find(id)
        @client.get("quote/#{id}")
      end
    end
  end
end