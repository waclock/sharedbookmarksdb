module Api
  module V1
    class UsersController < ApplicationController
# curl "http://sharedbookmarks.herokuapp.com/api/log_in?email=user@example.com&password=123456"      
      before_filter :restrict_access
      def restrict_access
        access_token=request.headers["HTTP_ACCESS_TOKEN"]
        email=request.headers["HTTP_EMAIL"]
        password=request.headers["HTTP_PASSWORD"]
        puts access_token
        # if params[:access_token]!=nil
        if access_token!=nil
          api_key = ApiKey.find_by_access_token(access_token)
          puts api_key.to_s
          @user = api_key ? api_key.user : nil
          head :unauthorized unless @user
        elsif email!=nil&&password!=nil
          @user = User.authenticate(email, password)
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
        @user.bookmarks_as_json
      end
      def show
        respond_with @user ? User.find(@user.id) : User.find_by_email(params[:id])
      end
      def new_group
        g=user.groups.where(name: params[:name]).first_or_create
      end

    end
  end
end