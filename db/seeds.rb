require 'open-uri'
require 'json'

puts "Cleaning up movies..."
Movie.destroy_all

puts "Fetching top-rated movies..."
url = 'https://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
movies = JSON.parse(response)['results']

puts "Creating movies..."
movies.each do |movie_data|
  Movie.create!(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_data['poster_path']}",
    rating: movie_data['vote_average']
  )
end

puts "✅ Done! Created #{Movie.count} movies."
