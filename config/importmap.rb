# Pin npm packages by running ./bin/importmap

pin "application"
pin "inputmask", to: "inputmask.min.js"
pin "jquery", to: "jquery.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus-webpack-helpers", to: "stimulus-webpack-helpers.js"
pin "@popperjs/core", to: "popper.js/dist/esm/popper.js"
# pin "@hotwired/turbo-rails", to: "turbo.min.js"
# pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap/dist/js/bootstrap.bundle.min.js"
# pin "admin", to: "app/javascript/admin.js"
