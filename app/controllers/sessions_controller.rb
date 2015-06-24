class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_url
        #redirect_back_or user
      else
        message  = I18n.t('msg_account_not_activated')
        message += I18n.t('msg_check_email_for_activation')
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:alert] = I18n.t('msg_invalid_login_info')
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
