class UsersController < ApplicationController
  # ... other actions ...
  before_action :authenticate_user!
  private

  def user_params
    params.require(:user).permit(:email, :name, :address, :phone, :linkedin, :github)
  end
end
