class OrdenTrabajosImportsController < ApplicationController
  def new
  end

  def create
    if params[:file].blank?
      redirect_to orden_trabajos_imports_new_path, alert: "Debes seleccionar un archivo Excel."
      return
    end

    service = OrdenTrabajoImportService.new(params[:file])

    if service.call
      redirect_to orden_trabajos_path, notice: "Importación completada (#{service.imported_count} registros)."
    else
      log_path = Rails.root.join("log", "import_errors.log")
      File.open(log_path, "a") { |f| f.puts service.errors.join("\n") }
      redirect_to orden_trabajos_imports_new_path, alert: "Se detectaron errores (#{service.errors.count}). Revisá log/import_errors.log"
    end
  end
end
