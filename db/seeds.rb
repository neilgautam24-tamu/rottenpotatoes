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
    :release_date => '12-Mar-2024' },
  { :title => 'Satoru Gojo', :rating => 'PG-13', 
    :release_date => '16-Sep-2019' },
  { :title => 'One Piece', :rating => 'R',
    :release_date => '19-Apr-2028' }
]

# Updated Code with duplication prevention functionality
more_movies.each do |movie_attrs|
    Movie.find_or_create_by(title: movie_attrs[:title]) do |movie_obj|
        movie_obj.rating = movie_attrs[:rating]
        movie_obj.release_date = movie_attrs[:release_date]
    end
end
