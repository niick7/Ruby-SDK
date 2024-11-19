require_relative '../lib/lotr_sdk'

# Initialize the SDK using version 1
sdk = LotrSDK.version("v1")

# Create instances of the services
movie_service = sdk::MovieService.new
quote_service = sdk::QuoteService.new

# Demonstration of Movie Service
puts "Listing all movies:"
movies = movie_service.all
puts movies

puts "\nFetching a specific movie by ID:"
movie_id = "5cd95395de30eff6ebccde5b" # Example movie ID, replace with a valid one
movie_details = movie_service.find(movie_id)
puts movie_details

puts "\nFetching quotes for a specific movie:"
movie_quotes = movie_service.quotes(movie_id)
puts movie_quotes

# Demonstration of Quote Service
puts "\nListing all quotes:"
quotes = quote_service.all
puts quotes

puts "\nFetching a specific quote by ID:"
quote_id = "5cd96e05de30eff6ebcce7e9" # Example quote ID, replace with a valid one
quote_details = quote_service.find(quote_id)
puts quote_details