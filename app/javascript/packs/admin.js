// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs
//= require turbolinks

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"

Rails.start()
ActiveStorage.start()

require('jquery')
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import("../material-dashboard")
