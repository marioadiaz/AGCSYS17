import { Controller } from "@hotwired/stimulus"

// Controlador: orden-trabajo
// Se activa con data-controller="orden-trabajo"
export default class extends Controller {
  static targets = ["submitButton"];

  actualizado(event) {
    console.log("✅ Método actualizado() ejecutado");
    console.log("event.detail.success:", event.detail.success);

    // Turbo dispara el evento desde el form
    const form = event.target;
    const boton =
      this.hasSubmitButtonTarget
        ? this.submitButtonTarget
        : form.querySelector('button[type="submit"], input[type="submit"]');

    console.log("➡️ Botón detectado:", boton);

  //   if (!boton) return;

    // Si el guardado fue exitoso
  //   if (event.detail.success) {
      // Cambiar texto / color
  //     if (boton.tagName === "BUTTON") boton.textContent = "Ok";
  //     else boton.value = "Ok";

  //     boton.disabled = true;
  //     boton.classList.replace("btn-primary", "btn-success");

    // Volver al estado original luego de 2 s
  //     setTimeout(() => {
  //       if (boton.tagName === "BUTTON") boton.textContent = "Actualizar";
  //       else boton.value = "Actualizar";

  //       boton.disabled = false;
  //       boton.classList.replace("btn-success", "btn-primary");
  //     }, 2000);

  //  } else {
  //    alert("❌ Error al actualizar la orden.");
  //  }
  }
}
