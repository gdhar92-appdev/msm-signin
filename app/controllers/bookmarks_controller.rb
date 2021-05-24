class BookmarksController < ApplicationController

  def show
    
    @the_user = User.where({ :id => session.fetch(:user_id)}).at(0)

    render({ :template => "bookmark_templates/show.html.erb"})
  end

end