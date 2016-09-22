module SessionsHelper

  #log in given member
  def log_in_member(member)
    session[:member_id] = member.id
  end

  # Returns the current logged-in member (if any).
  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end


  # Returns the current logged-in admin (if any).
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def member_logged_in?
    !current_member.nil?
  end


  def admin_logged_in?
    !current_admin.nil?
  end

  def log_out
    if member_logged_in?
      session.delete(:member_id)
    else
      session.delete(:admin_id)
    end
  end



end
