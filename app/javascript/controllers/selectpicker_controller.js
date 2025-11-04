import { Controller } from "@hotwired/stimulus"

// Controlador Stimulus para selectpicker (Bootstrap Select)
export default class extends Controller {
  connect() {
    const $select = $(this.element);

    if ($select.hasClass("selectpicker")) {
      // Destruye instancias previas (importante si Turbo reemplaza la vista)
      $select.selectpicker("destroy");
      // Inicializa el control
      $select.selectpicker();
    }
  }
}
