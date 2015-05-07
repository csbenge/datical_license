class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  #before_action :admin_user,     only: :destroy

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  def new
  	 @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = I18n.t('msg_user_activate_email_sent')
      redirect_to root_url
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = I18n.t('msg_user_account_updated')
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      if @user.email == current_user.email
        flash[:alert] = I18n.t('msg_admin_cannot_delete_self')
        redirect_to users_url
      else
        @user.delete
        flash[:success] = I18n.t('msg_account_cancelled')
        redirect_to users_url
      end
    else
      @user.delete
      flash[:success] = I18n.t('msg_account_cancelled')
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = I18n.t('msg_please_login')
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      unless current_user.admin?
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
    end

end
