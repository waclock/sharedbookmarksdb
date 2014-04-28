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
        # respond_with @user.get_bookmarks.map{|b| JSON.parse(b.to_json)}
      def bookmarks
        @group=Group.all
      end
      def show
        respond_with @user ? User.find(@user.id) : User.find_by_email(params[:id])
      end

    end
  end
end