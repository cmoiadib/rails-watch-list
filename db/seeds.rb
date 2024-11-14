require "open-uri"
require "json"

url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=8d7f04a36275e204d04a7c56a5f1ce0e"
movie_list = URI.open(url).read
movies = JSON.parse(movie_list)["results"]

puts "Creating movies"

movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}", rating: movie["vote_average"].round(1))
end

puts "#{Movie.count} movies created!"
