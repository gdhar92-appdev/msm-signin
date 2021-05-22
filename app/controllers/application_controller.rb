class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "misc_templates/home"})
  end

  def sign_in
    render({ :template => "misc_templates/user_sign_in.html.erb"})
  end

  def sign_up
    render({ :template => "misc_templates/user_sign_up.html.erb"})
  end

end
