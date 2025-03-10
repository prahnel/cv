# app/controllers/cv_data_controller.rb
    class CvDataController < ApplicationController
      def show
        user_id = params[:user_id] #get the user id from the request.
        user = User.find(user_id) #get the user.

        # Fetch CV data (replace with your actual data retrieval logic)
        cv_data = {
          name: user.name,
          contact: {
            email: user.email,
            phone: user.phone,
            address: user.address
          },
          education: user.educations.map { |edu| { school: edu.school, degree: edu.degree } },
          skills: user.skills.split(','), #example of how to split a comma seperated list.
          experience: user.experiences.map { |exp| { company: exp.company, title: exp.title } }
          # ... other fields ...
        }

        render json: cv_data
      end
    end
