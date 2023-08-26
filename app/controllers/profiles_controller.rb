class ProfilesController < ApplicationController
  before_action :set_user,only: %i[edit update]

  def edit; end
    
  def update
    if @user.update(user_params)
      redirect_to profile_path, success: 'Profile was successfully updated.'
    else
      flash.now['daner'] = 'Failed to update the profile.'
      render :edit 
    end 
  end
    
  def show; end
    
  private
    
  def set_user
    @user = User.find(current_user.id)
  end
  
  def user_params
    params.require(:user).permit(:email, :last_name, :first_name,:avatar, :avater_cashe)
  end
end
