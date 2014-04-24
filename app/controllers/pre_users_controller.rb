class PreUsersController < ApplicationController
  
  # POST /pre_users
  def create
    @pre_user = PreUser.new(user_params)

    if @pre_user.save
      UserMailer.pre_welcome(@pre_user).deliver
      redirect_to home_path, notice: t('notice.pre_user.create')
    else
      redirect_to home_path, notice: t('notice.pre_user.error')
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:pre_user).permit(:email, :location)
    end


end
