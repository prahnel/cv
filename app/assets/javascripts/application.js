//= require cocoon
import flatpickr from "flatpickr";
document.addEventListener('turbo:load', () => {
  flatpickr(".datepicker", {
    dateFormat: "m/d/Y"
  });
});
