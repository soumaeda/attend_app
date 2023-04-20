class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
      user_path(id: @user.id)
    end
    
    def after_sign_out_path_for(resource)
      new_user_session_path
    end
    
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        log_in(user)
        user.update_attribute(:is_logged_in, true) # ログイン状態をtrueにする
        redirect_to root_path, notice: 'ログインしました'
      else
        flash.now[:alert] = 'ログインに失敗しました'
        render :new
      end
    end

  def destroy
    current_user.update_attribute(:is_logged_in, false) # ログイン状態をfalseにする
    log_out
    redirect_to login_path, notice: 'ログアウトしました'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
