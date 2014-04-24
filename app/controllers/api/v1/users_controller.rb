module Api
  module V1
    class UsersController < ApplicationController
# curl "http://sharedbookmarks.herokuapp.com/api/log_in?email=user@example.com&password=123456"      
      before_filter :restrict_access
      def restrict_access
        if params[:access_token]!=nil
          api_key = ApiKey.find_by_access_token(params[:access_token])
          @user = api_key ? api_key.user : nil
          head :unauthorized unless @user
        elsif params[:email]!=nil&&params[:password]!=nil
          @user = User.authenticate(params[:email], params[:password])
          head :unauthorized unless @user
        else
          head :unauthorized
        end
      end
      
      respond_to :json

      def index
        return render nothing: true unless @user.admin
        respond_with User.all.map{|u| JSON.parse(u.to_json) }
      end

      def show
        #the device is created if a mac_address is sent
        # if params[:mac_address]
        #   if params[:enterprise_name]
        #     e = Enterprise.find_by_name(params[:enterprise_name])
        #   else
        #     e = @user.enterprises.first
        #   end
        #   if e&&(@user.admin&&@user.user_enterprises.where(enterprise_id: e.id).any?())
        #     #It can only add devices to an enterprise that belongs to him or if he is admin
        #     #si no existe lo creamos como 'Nuevo Dispositivo'
        #     if e.devices.where(mac: params[:mac_address]).empty?()
        #       count = e.device_enterprises.count+1
        #       e.devices.create(mac: params[:mac_address], name: "Nuevo Dispositivo "+count.to_s)
        #     end
        #   end
        # end
        respond_with @user ? User.find(@user.id) : User.find_by_email(params[:id])
        # respond_with true
      end

    end
  end
end