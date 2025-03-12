class CvDataController < ApplicationController
  def show
    user_id = params[:user_id]
    user = User.find(user_id)

    # Find the user's CV
    cv = user.cvs.first # Assuming each user has only one CV; adjust if needed

    if cv
      # Fetch CV data
      cv_data = {
        name: cv.name, #or user.name if you prefer
        contact: {
          email: user.email,
          phone: user.phone,
          address: user.address
        },
        education: cv.educations.map do |edu|
          {
            start_date: edu.start_date,
            end_date: edu.end_date,
            school: edu.school,
            summary: edu.summary,
            details: edu.degree
          }
        end,
        skills: cv.skills.split(','), # Assuming skills are comma-separated
        experience: cv.work_experiences.map do |exp|
          {
            start_date: exp.start_date,
            end_date: exp.end_date,
            summary: exp.summary,
            details: exp.details
          }
        end
      }

      render json: cv_data
    else
      render json: { error: "CV not found for user" }, status: :not_found
    end
  end
end
