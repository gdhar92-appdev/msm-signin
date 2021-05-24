# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord

  def movie
    my_movie_id = self.movie_id

    matching_movies = Movie.where(:id => my_movie_id)
    the_movie = matching_movies.at(0)

    return the_movie

  end

end
