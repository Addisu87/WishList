module ApplicationHelper
  def admin?
    redirect_to new_user_session_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
  end
end
