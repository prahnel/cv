/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb', // All ERB files in app/views
    './app/helpers/**/*.rb',   // All Ruby helper files
    './app/javascript/**/*.js', // JavaScript files
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
