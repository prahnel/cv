class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def new
    @profile = Profile.new
    @profile.user = current_user
    @profile.user.educations.build # Build an empty education entry

  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(@profile), notice: 'Profile created successfully'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Profile updated successfully'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    #@profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :email, :phone, :address, :summary,
    educations_attributes: [:id, :start_date, :end_date, :institution, :degree, :summary, :_destroy]
  )
  end
end
