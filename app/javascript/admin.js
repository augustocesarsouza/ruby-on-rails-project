// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import "./controllers"

import './add_jquery.js'


import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

import "./sbadmin/sbadmin.js" 
import "./sbadmin/jquery-easing/jquery.easing.min.js"
