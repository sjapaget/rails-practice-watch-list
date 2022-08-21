# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'


puts 'Cleaning the DB'
Movie.destroy_all

puts 'Fetching movies'

movies_serialized = URI.open('https://tmdb.lewagon.com/movie/top_rated?').read

movies = JSON.parse(movies_serialized)["results"]

movies.each do |movie|
  puts 'Creating new movie'
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
  puts "Created #{movie["title"]}"
end

puts "All done"
