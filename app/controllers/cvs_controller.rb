class CvsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_cv, only: [:show, :edit, :update] 

  def new
    @cv = @user.cvs.build
    2.times { @cv.educations.build }
    2.times { @cv.work_experiences.build }
  end

  def create
    @cv = @user.cvs.build(cv_params)
    if @cv.save
      redirect_to user_cv_path(@user, @cv), notice: 'CV created successfully.'
    else
      render :new
    end
  end

  def show
  end

  def edit
     @cv = @user.cvs.find(params[:id]) # Fetch the CV using its ID
  end

  def set_cv
    puts "set_cv called with params[:id] = #{params[:id]}"
    begin
      @cv = @user.cvs.find(params[:id])
      puts "set_cv found @cv: #{@cv.inspect}"
    rescue ActiveRecord::RecordNotFound
      puts "set_cv: CV not found for user_id: #{@user.id} and cv_id: #{params[:id]}"
      @cv = nil # Explicitly set @cv to nil in case of error
    rescue StandardError => e
      puts "set_cv: An error occurred: #{e.message}"
      @cv = nil # Explicitly set @cv to nil in case of error
    end
  end

  def update
    if @cv.update(cv_params)
      redirect_to user_cv_path(@user, @cv), notice: 'CV updated successfully.'
    else
      render :edit
    end
  end


  private

  def set_user
    @user = current_user
  end

  def cv_params
    params.require(:cv).permit(
      :name, :skills,
      educations_attributes: [:id, :start_date, :end_date, :summary, :details, :_destroy],
      work_experiences_attributes: [:id, :start_date, :end_date, :summary, :details, :_destroy]
    )
  end
end
