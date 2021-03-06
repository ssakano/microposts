class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # include SessionsHelperを使用することで、モジュール内のメソッドをインスタンスメソッドとして取り込むことができる。
  # これをMix-inという。
  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_fevorite_microposts = user.fevorite_microposts.count
  end

end
