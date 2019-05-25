module SessionsHelper
  # Helperモジュールは全てのViewの中で無条件で使用できる
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
