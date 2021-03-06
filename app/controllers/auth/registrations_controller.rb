class Auth::RegistrationsController < Auth::BaseController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    verify_recaptcha!(fallback_action: :new) { return }

    if @user.save
      signin_as(@user)
      redirect_to edit_profile_path, notice: 'Welcome to incubit!'
    else
      flash.now[:alert] = 'Something went wrong!'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).
      permit(:email, :password, :password_confirmation)
  end
end
