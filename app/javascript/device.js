// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "hotwired/turbo-rails"
import "@hotwired/turbo-rails"
import "./controllers"
// import "./jquery"
import * as bootstrap from "bootstrap"

Turbo.session.drive = false

// import { Turbo } from '@hotwired/turbo-rails'
// Turbo.session.drive = false