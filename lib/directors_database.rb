require 'yaml'

def directors_database
	rot13 = -> (s) { s.tr('A-Za-z', 'N-ZA-Mn-za-m') }
  @_db ||= YAML.load(rot13.call(File.open("directors_db").read.to_s))
end

def directors_totals(directors_database)

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
#pp directors_database[0][:movies][0][:worldwide_gross] # this is Stephen Spielberg first movie gross income
# pp directors_database
#
#
# row_index = 0
# total_gross_from_movies = 0
# while row_index < directors_db.length do
#   column_index = 0
#   while column_index < directors_db[row_index][:movies].length do
#     total_gross_from_movies += directors_db[row_index][:movies][column_index][:worldwide_gross]
#     column_index += 1
#   end
#   p "#{directors_db[row_index][:name]} has earned a total of #{total_gross_from_movies}"
#   row_index += 1
# end
#
#
#
# row_index = 0
# total = 0
# while row_index < directors_db[0][:movies].length do
#   total += directors_db[0][:movies][row_index][:worldwide_gross]
#   row_index += 1
# end
# puts total
#
#
# def directors_totals(directors_db)
# total_gross_from_movies = 0
# directors_counter = 0
# my_hash = {}
# while directors_counter < directors_db.length do
#   movie_counter = 0
#   director_name = directors_db[directors_counter][:name]
#   while movie_counter < directors_db[directors_counter][:movies].length do
#     total_gross_from_movies += directors_db[directors_counter][:movies][movie_counter][:worldwide_gross]
#     movie_counter += 1
#   end
#   my_hash[director_name] = total_gross_from_movies # This adds the new key and new value to the hash.
#   directors_counter += 1
# end
#   p my_hash
#
# end
