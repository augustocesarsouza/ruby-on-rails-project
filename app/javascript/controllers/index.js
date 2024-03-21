// Import and register all your controllers from the importmap under controllers/*

// import { application } from "./controllers/application"
import { application } from "./application"

import AdminModalController from "./admin_modal_controller"
application.register("admin-modal", AdminModalController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import ChangeAvatarController from "./change_avatar_user_controller"
application.register("change-avatar-user", ChangeAvatarController)

import RemoveAvatarController from "./remover_avatar_user_controller"
application.register("remover-avatar-user", RemoveAvatarController)

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
