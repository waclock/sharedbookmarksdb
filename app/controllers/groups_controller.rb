class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show
    @users=@group.users
    @all_users=User.where.not(id: @users.collect(&:id))
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end
  def add_user
    user=User.find_by_email(params[:email])
    if user
      puts "Creando UserGroup"
      UserGroup.where(user_id: user.id,group_id: params[:group_id]).first_or_create
    end
    render json:{success: true}
  end
  # POST /groups
  def create
    @group = Group.new(group_params)
    if @group.save
      UserGroup.create(user_id: @group.user_id, group_id: @group.id)
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:name, :user_id)
    end
end
