class RolesController < ApplicationController
  def create
    @role = Role.new(role_params)
    @role.name=params[:role][:name].strip.upcase
    @role.save
    redirect_to user_path(@role.user_id)
  end

  def show
    if params[:filter].present?
      # get list of users with same role
      @roles = Role.where(nil).role_filter(params[:filter])
      @filter = params[:filter]

    end



  end


  private
    def role_params
      params.require(:role).permit(:name, :user_id)
    end
end
