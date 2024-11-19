require 'faraday'
require 'dotenv/load'
require 'faraday/retry' # Require the faraday-retry middleware

module LotrSDK
  module V1
    class Client
      def initialize(api_key = ENV['API_KEY'])
        @api_key = api_key
        @connection = Faraday.new(url: ENV['API_URL']) do |conn|
          # Encode URL parameters
          conn.request :url_encoded
          # Parse JSON response
          conn.response :json, content_type: /\bjson$/
          # Default HTTP adapter; you can change this to another adapter, such as
          # :typhoeus or :excon, for better performance or additional features
          # Details: https://github.com/lostisland/awesome-faraday/#adapters
          conn.adapter Faraday.default_adapter
          # Set timeouts (in seconds)
          conn.options.open_timeout = 5  # Timeout for opening the connection
          conn.options.timeout = 10      # Timeout for reading the response
          conn.request :retry, max: 3, interval: 0.5, interval_randomness: 0.5, backoff_factor: 2,
                                exceptions: [Faraday::TimeoutError, Faraday::ConnectionFailed]
        end
      end

      # Method to send GET requests
      def get(endpoint, params = {})
        response = @connection.get(endpoint, params) do |req|
          req.headers['Authorization'] = "Bearer #{@api_key}"
        end
        response.body
      rescue Faraday::ConnectionFailed => e
        { error: "Network connection failed: #{e.message}" }
      rescue Faraday::TimeoutError => e
        { error: "Request timed out: #{e.message}" }
      rescue Faraday::SSLError => e
        { error: "SSL error: #{e.message}" }
      rescue Faraday::ClientError => e
        { error: "Client error: #{e.message}" }
      end
    end
  end
end