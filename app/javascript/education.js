document.addEventListener("DOMContentLoaded", function () {
  const addEducationBtn = document.getElementById("add-education");
  const educationContainer = document.getElementById("educations");
  const educationTemplate = document.getElementById("education-template").content;

  addEducationBtn.addEventListener("click", function (e) {
    e.preventDefault();
    const newEducation = educationTemplate.cloneNode(true);
    educationContainer.appendChild(newEducation);
  });

  document.addEventListener("click", function (e) {
    if (e.target.classList.contains("remove-education")) {
      e.preventDefault();
      e.target.closest(".education-entry").remove();
    }
  });
});
