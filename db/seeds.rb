# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Style.create(
  name: "Formal Blue",
  font_family: "Helvetica",
  heading_color: "004080",
  text_color: "333333",
  font_size: 12
)

Style.create(
  name: "Classic Black",
  font_family: "Times-Roman",
  heading_color: "000000",
  text_color: "444444",
  font_size: 11
)
