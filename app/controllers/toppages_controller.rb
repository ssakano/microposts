class ToppagesController < ApplicationController
  def index
<<<<<<< HEAD
    if logged_in?
      @micropost = current_user.microposts.build # form_for 用
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
    end
=======
    # @users = User.all
    # @microposts = Micropost.all
    @test_message = "これはテストです。"
>>>>>>> 1d4a42726e2e3869b8c83640a6c84a49edd82336
  end
end
