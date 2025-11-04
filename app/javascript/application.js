// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "custom/scroll_top"
import "custom/buscador_datos"

import "jquery"
window.$ = window.jQuery = globalThis.jQuery
import * as bootstrap from "bootstrap"
import "@fortawesome/fontawesome-free"
import "bootstrap.bundle"


document.addEventListener("turbo:load", () => {
  console.log("✅ Turbo y Bootstrap funcionando con assets locales");
});
