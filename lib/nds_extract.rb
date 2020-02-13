$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

def directors_totals(nds)
  total_gross_from_movies = 0
  directors_counter = 0
  my_hash = {}
  while directors_counter < directors_database.length do
    movie_counter = 0
    director_name = directors_database[directors_counter][:name]
    while movie_counter < directors_database[directors_counter][:movies].length do
      total_gross_from_movies += directors_database[directors_counter][:movies][movie_counter][:worldwide_gross]
      movie_counter += 1
    end
    my_hash[director_name] = total_gross_from_movies # This adds the new key and new value to the hash.
    directors_counter += 1
  end
    p my_hash
end
