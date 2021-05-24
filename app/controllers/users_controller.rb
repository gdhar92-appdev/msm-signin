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

  def authenticate
    
    user_email = params.fetch("input_email")
    pw = params.fetch("input_password")

    the_user = User.where({:email => user_email}).at(0)

    if the_user == nil
      redirect_to("/user_sign_in", {:alert => "Username does not exist"})
    else
      if the_user.authenticate(pw)
        session.store(:user_id, the_user.id)
        redirect_to("/")
      else
        redirect_to("/user_sign_in", {:alert => "Incorrect Password"})
      end
    end
  end

end