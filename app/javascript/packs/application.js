// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")
import "bootstrap"

window.jQuery = $;
window.$ = $;

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function() {
  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    console.log('aaaaaa');
    event.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    return $(this).before($(this).data('fields').replace(regexp, time));
  });

  $('form').on('click', '.remove_fields', function(event) {
    event.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    return $(this).closest('.fieldset').hide();
  });
})

