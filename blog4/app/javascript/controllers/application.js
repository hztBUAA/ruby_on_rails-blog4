import { Application } from "@hotwired/stimulus"
//= require rails-ujs
//  require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .

// Your application JavaScript code




import "@hotwired/turbo-rails"
import "controllers"


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
