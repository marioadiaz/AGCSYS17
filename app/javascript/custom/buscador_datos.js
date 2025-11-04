// app/javascript/buscador_datos.js
document.addEventListener("turbo:load", () => {
  const $buscador = $("#buscador_datos");
  const $filas = $("#TablaOrdenesTrabajos tbody tr");

  if ($buscador.length && $filas.length) {
    console.log("✅ Buscador inicializado, filas detectadas:", $filas.length);

    $buscador.on("keyup", function() {
      const value = $(this).val().toLowerCase().trim();

      $filas.each(function() {
        const textoFila = $(this).text().toLowerCase();
        $(this).toggle(textoFila.includes(value));
      });
    });
  } else {
    console.warn("⚠️ No se encontró #buscador_datos o #TablaOrdenesTrabajos");
  }
});
