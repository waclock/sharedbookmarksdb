module Api
  module V1
    class UsersController < ApplicationController
# curl "http://sharedbookmarks.herokuapp.com/api/log_in?email=user@example.com&password=123456"      
      skip_filter :verify_authenticity_token
      before_filter :restrict_access
      def restrict_access
        access_token=request.headers["HTTP_ACCESS_TOKEN"]||params[:access_token]
        email=request.headers["HTTP_EMAIL"]||params[:email]
        password=request.headers["HTTP_PASSWORD"]||params[:password]
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
        respond_with @user.bookmarks_as_json
      end
      def show
        respond_with @user ? User.find(@user.id) : User.find_by_email(params[:id])
      end
      def new_group
        g=Group.where(name: params[:name],user_id: @user.id).first_or_create
        UserGroup.where(user_id: g.user_id, group_id: g.id).first_or_create
        respond_with g
      end
      def new_folder
        f=Folder.where(name: params[:name],group_id: params[:group_id]).first_or_create
        respond_with f
      end
      def new_bookmark
        b=Bookmark.where(name:params[:name],folder_id: params[:folder_id]).first_or_create(link: params[:link])
        respond_with b
      end
      def delete_group
        g=Group.where(id: params[:id],user_id: @user.id).first
        if g
          g.delete
          return render text:"Success"
        else
          return render text:"Ha ocurrido un error borrando el grupo"
        end
      end

    end
  end
end