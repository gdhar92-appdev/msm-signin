class BookmarksController < ApplicationController

  def show
    
    @the_user = User.where({ :id => session.fetch(:user_id)}).at(0)

    render({ :template => "bookmark_templates/show.html.erb"})
  end

  def create
    bk = Bookmark.new

    bk.user_id = session.fetch(:user_id)
    bk.movie_id = params.fetch("query_movie_id")

    bk.save

    redirect_to("/bookmarks")
  end

  def delete_record
    the_id = params.fetch("bookmark_id").to_i

    the_bookmark = Bookmark.where({ :id => the_id }).at(0)

    the_bookmark.destroy
    
    redirect_to("/bookmarks")
    
  end

end