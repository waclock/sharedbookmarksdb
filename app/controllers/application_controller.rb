class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  
  #En caso de faltar permisos con CanCan
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  before_filter :set_locale
  def set_locale
    #en application.rb se setea el default
    #aqui vemos su posición y revisamos el idioma que corresponde
    I18n.locale = 'es'
  end

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
      	session[:user_id] = nil
        nil
      end
    end

end
