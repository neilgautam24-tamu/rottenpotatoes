# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

more_movies = [
  {:title => 'My Neighbor Totoro', :rating => 'G',
    :release_date => '16-Apr-1988'},
  {:title => 'Green Book', :rating => 'PG-13',
    :release_date => '16-Nov-2018'},
  {:title => 'Parasite', :rating => 'R',
    :release_date => '30-May-2019'},
  {:title => 'Nomadland', :rating => 'R',
    :release_date => '19-Feb-2021'},
  {:title => 'CODA', :rating => 'PG-13',
    :release_date => '13-Aug-2021'},
  { :title => 'Schindlers List', :rating => 'R', 
    :release_date => '1980-Mar-2024' },
  { :title => 'Satoru Gojo', :rating => 'PG-13', 
    :release_date => '2019-Sep-2019' },
  { :title => 'One Piece', :rating => 'R',
    :release_date => '2014-Apr-2028' }
]

# more_movies.each do |movie|
#   Movie.create!(movie)
# end

more_movies.each do |movie_data|
  existing_movie = Movie.find_by(title: movie_data[:title])

  if existing_movie.nil?
    Movie.create(movie_data)
  end
end
