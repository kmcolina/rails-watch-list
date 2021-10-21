# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Destroy all"
Bookmark.destroy_all
Review.destroy_all
List.destroy_all
Movie.destroy_all
puts "Listo"

puts "Creando movies usando API"

movies_url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_json = URI.open(movies_url).read
movies = JSON.parse(movie_json)
movies_results = movies["results"]

movies_results.each do |item|
  new_movie = Movie.new(
    title: item['original_title'],
    overview: item['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{item['poster_path']}",
    rating: item['vote_average'])

  new_movie.save!
end

List.create(name: 'Drama')
List.create(name: 'All time favourites')
g = List.create(name: 'Girl Power')
Review.create! comment: "comentario",  rating: 2, list_id: g.id

Bookmark.create(comment: 'Recomended by John', movie_id: 3, list_id: 2)
Bookmark.create(comment: 'Super heroe movie', movie_id: 1, list_id: 3)
Bookmark.create(comment: 'Spielberg masterly oscar-winning drama', movie_id: 2, list_id: 2)
Bookmark.create(comment: '2020 Release', movie_id: 5, list_id: 1)
Bookmark.create(comment: 'Based on Stephen kings ', movie_id: 4, list_id: 3)
Bookmark.create(comment: 'Based on Stephen kings ', movie_id: 9, list_id: 4)

Bookmark.create(comment: 'SuperHeroe', movie_id: 21, list_id: 4)

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
