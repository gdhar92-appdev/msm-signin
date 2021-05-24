class UsersController < ApplicationController

  def sign_in
    render({ :template => "user_templates/user_sign_in.html.erb"})
  end

  def sign_up
    render({ :template => "user_templates/user_sign_up.html.erb"})
  end

  def create
    user = User.new
    
    user.email = params.fetch("input_email")
    user.first_name = params.fetch("input_first_name")
    user.last_name = params.fetch("input_last_name")
    user.password = params.fetch("input_password")
    user.password_confirmation = params.fetch("input_password_confirmation")

    save_status = user.save

    if save_status == true
      session.store(:user_id, user.id)
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => user.errors.full_messages.to_sentence})
    end
    
  end

end