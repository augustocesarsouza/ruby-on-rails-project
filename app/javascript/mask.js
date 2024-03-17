import Inputmask from "inputmask";

document.addEventListener("DOMContentLoaded", function() {
  if (window.jQuery) {
    const elements = document.querySelectorAll(".mask-phone");
    const im_phobne = new Inputmask("99-99999999");
    elements.forEach(element => {
      im_phobne.mask(element);
    });
  }
});