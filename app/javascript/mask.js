import Inputmask from "inputmask";

document.addEventListener("DOMContentLoaded", function() {
  if (window.jQuery) {
    const element_phone = document.getElementsByClassName("mask-phone")
    const im_phone = new Inputmask("(99) 999999999")
    im_phone.mask(element_phone)
  }
});