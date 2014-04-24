class UsersController < ApplicationController
  
  load_and_authorize_resource except: [:create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.email=@user.email.downcase

    respond_to do |format|
      if @user.save
        UserMailer.welcome(@user).deliver
        format.html { redirect_to home_path, notice: t('notice.user.create') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    #si no pone contraseña para cambiar o si hace click en actualizar y no en cambiar contraseña
    if params[:user][:password].blank?()||params[:commit]==t('modules.register.btn_update')
      [:password,:current_password].collect{|p| params[:user].delete(p) }
    else
      @user.errors[:base] << t('active_record.errors.models.user.password.confirmation') unless @user.valid_password?(params[:user][:current_password])
      @user.errors[:base] << t('active_record.errors.models.user.password.too_short') unless params[:user][:password].length<4
    end

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: t('notice.user.update') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def activate
    @token = Token.find_by_value(params[:token])
    @user = @token.user
    @user.update_attribute :active, true
    # para obligarlo a completar el perfil
    # @user.update_attribute :first_login, true
    session[:user_id] = @user.id
    # Borramos para no acumular basura
    @token.destroy
    redirect_to home_path, notice: t('notice.user.activate')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :avatar, :avatar_file_name)
    end


end
