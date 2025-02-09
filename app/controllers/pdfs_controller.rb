class PdfsController < ApplicationController
  before_action :authenticate_user!

  def generate_cv
    @profile = current_user.profile

    # Fetch the "Formal Blue" style from the database
    @style = Style.find_by(name: "Formal Blue")

    pdf = Prawn::Document.new
    

    # Set up fonts using the style's font_family
    pdf.font_families.update(
      "CustomFont" => {
        normal: @style.font_family,
        bold: "#{@style.font_family}-Bold",
        italic: "#{@style.font_family}-Oblique",
        bold_italic: "#{@style.font_family}-BoldOblique"
      }
    )
    pdf.font "CustomFont"

    # Define table layout
    pdf.table([
      [
        # Left Column (Shaded Section)
        {
          content: "Personal Information\n\n" +
                   "Name: #{@profile.name}\n" +
                   "Email: #{@profile.email}\n" +
                   "Phone: #{@profile.phone}\n" +
                   "Address: #{@profile.address}",
          background_color: "F0F0F0", # Light gray background
          text_color: @style.text_color,
          font_style: :normal,
          size: @style.font_size,
          padding: 10,
          border_width: 0 # No border
        },
        # Right Column (Main Content)
        {
          content: "Curriculum Vitae\n\n" +
                   "Professional Summary:\n#{@profile.summary}\n\n" +
                   "\nEducation:\n" +
                   @profile.educations.map do |edu|
                     "#{edu.degree}\n#{edu.institution} | #{edu.start_date} - #{edu.end_date}\n#{edu.description}\n"
                   end.join("\n"),
                   #{}"\nSkills:\n#{@profile.skills}",
          text_color: @style.text_color,
          font_style: :normal,
          size: @style.font_size,
          padding: 10,
          border_width: 0 # No border
        }
      ]
    ], width: pdf.bounds.width) do
      # Style the table
      cells.borders = [] # Remove all borders
      column(0).width = 150 # Set width of the left column
      column(0).align = :left
      column(1).align = :left
    end

    # Footer
    pdf.move_down 30
    pdf.text "Generated on #{Date.today}", size: 10, align: :center, color: "999999"

    # Send the PDF
    send_data pdf.render, filename: "cv.pdf", type: "application/pdf", disposition: "inline"
  end
end
