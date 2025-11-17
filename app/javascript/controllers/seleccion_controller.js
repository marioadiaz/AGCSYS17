import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["lista"]

  agregar(event) {
    const boton = event.currentTarget

    const id = boton.dataset.id
    const cliente = boton.dataset.cliente
    const ot = boton.dataset.ot
    const prod = boton.dataset.prod
    const procesosActuales = boton.dataset.procesos || ""

    // 🟦 Máquina seleccionada
    const selectMaquina = document.querySelector("select[name='maquina']")
    const maquina = selectMaquina.value

    if (!maquina) {
      alert("⚠ Selecciona una máquina primero")
      return
    }

    // 🟩 Actualizar procesos (agrega ",MAQUINA")
    let nuevosProcesos = procesosActuales.split(",").filter(p => p !== "")
    if (!nuevosProcesos.includes(maquina)) {
      nuevosProcesos.push(maquina)
    }

    // 🟣 Hacer PATCH al backend
    fetch(`/orden_trabajos/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ orden_trabajo: { procesos: nuevosProcesos.join(",") } })
    })
    .then(r => {
      if (!r.ok) throw "Error al actualizar procesos"

      // 🟢 ACTUALIZAR LA COLUMNA PROCESO EN LA TABLA
      const celdaProceso = document.querySelector(`td[data-proceso][data-id='${id}']`)
      if (celdaProceso) {
        celdaProceso.textContent = nuevosProcesos.join(",")
      }

      console.log("✅ Procesos actualizados en BD:", nuevosProcesos.join(","))
    })
    .catch(err => console.error(err))

    // 🟢 Insertar fila en tabla seleccionados
    this.listaTarget.insertAdjacentHTML("beforeend", `
      <tr data-id="${id}">
        <td>${ot}</td>
        <td>${cliente}</td>
        <td>${prod}</td>
        <td>${nuevosProcesos}</td>
        <td>
          <button class="btn btn-danger btn-sm" data-action="seleccion#quitar" data-id="${id}">
            ❌ Quitar
          </button>
        </td>
      </tr>
    `)

    // 🟡 Cambiar botón
    boton.textContent = "✅ Ok"
    boton.classList.remove("btn-success")
    boton.classList.add("btn-secondary")
    boton.disabled = true

    // 🔄 Guardamos los nuevos procesos en el botón
    boton.dataset.procesos = nuevosProcesos.join(",")
  }

  quitar(event) {
    const id = event.currentTarget.dataset.id

    // ❌ Quitar de la tabla
    const fila = this.listaTarget.querySelector(`tr[data-id="${id}"]`)
    if (fila) fila.remove()

    // 🟢 Reactivar botón
    const boton = document.querySelector(`button[data-id='${id}']`)
    if (boton) {
      boton.textContent = "➕ Agregar"
      boton.classList.add("btn-success")
      boton.classList.remove("btn-secondary")
      boton.disabled = false
    }
  }
}
