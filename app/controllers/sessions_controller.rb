class SessionsController < ApplicationController
  def new_member
  end

  def create_member
    member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in_member member
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new_member'
    end
  end

  def new_admin
  end

  def create_admin
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
      session[:role] = 'Administrator'
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid login details'
      render 'new_admin'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
