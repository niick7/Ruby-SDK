require_relative '../lib/lotr_sdk'

# Initialize the SDK using version 1
sdk = LotrSDK.version('v1')

# Create instances of the services
movie_service = sdk::MovieService.new
quote_service = sdk::QuoteService.new

# === Solo Examples ===

# Example 1: Solo Pagination - List movies with pagination (limit: 5, page: 2)
puts "Listing movies with solo pagination (limit: 5, page: 2):"
paginated_movies = movie_service.all({ limit: 5, page: 2 })
puts paginated_movies

# Example 2: Solo Filtering - List movies that won at least one Academy Award
puts "\nListing movies with solo filtering (academyAwardWins > 0):"
filtered_movies = movie_service.all({ "academyAwardWins>" => 0 })
puts filtered_movies

# Example 3: Solo Filtering - List movies with name not equal to "The Lord of the Rings Series"
puts "\nListing movies with solo filtering (name != 'The Lord of the Rings Series'):"
filtered_movies = movie_service.all({ "name !=" => 'The Lord of the Rings Series' })
puts filtered_movies

# Example 4: Solo Filtering - List quotes by character ID "5cd99d4bde30eff6ebccfc15"
puts "\nListing quotes with solo filtering (character = '5cd99d4bde30eff6ebccfc15'):"
filtered_quotes = quote_service.all({ character: "5cd99d4bde30eff6ebccfc15" })
puts filtered_quotes

# === Combined Examples ===

# Example 5: Combined - List movies with pagination and filtering
puts "\nListing movies with combined pagination (limit: 5, page: 2) and filtering (academyAwardWins > 0):"
combined_movies = movie_service.all({
  limit: 5,
  page: 2,
  "academyAwardWins>" => 0
})
puts combined_movies

# Example 6: Combined - List quotes with pagination and filtering
puts "\nListing quotes with combined pagination (limit: 10, offset: 3) and filtering (character = '5cd99d4bde30eff6ebccfc15'):"
combined_quotes = quote_service.all({
  limit: 10,
  offset: 3,
  character: "5cd99d4bde30eff6ebccfc15"
})
puts combined_quotes

# === Other Examples ===

# Example 7: Find a specific movie by ID
puts "\nFinding a specific movie:"
movie_id = "5cd95395de30eff6ebccde5b" # Example ID
movie = movie_service.find(movie_id)
puts movie

# Example 8: Fetch quotes for a specific movie
puts "\nFetching quotes for a specific movie:"
movie_quotes = movie_service.quotes(movie_id)
puts movie_quotes

# Example 9: Find a specific quote by ID
puts "\nFinding a specific quote:"
quote_id = "5cd96e05de30eff6ebcce7e9" # Example ID
quote = quote_service.find(quote_id)
puts quote

# Example 10: Fetch quotes for a specific movie with pagination (limit: 5, page: 1)
puts "\nFetching quotes for a specific movie with pagination (limit: 5, page: 1):"
movie_quotes_paginated = movie_service.quotes(movie_id, { limit: 5, page: 1 })
puts movie_quotes_paginated

# Example 11: Combined pagination and filtering
puts "\nFetching quotes for a specific movie with combined pagination and filtering (limit: 5, offset: 2):"
movie_quotes_combined = movie_service.quotes(movie_id, { limit: 5, offset: 2 })
puts movie_quotes_combined