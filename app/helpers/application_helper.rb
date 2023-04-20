module ApplicationHelper
    def logged_in?
    current_user.is_logged_in
  end
end
