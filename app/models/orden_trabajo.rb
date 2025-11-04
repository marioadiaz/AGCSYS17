class OrdenTrabajo < ApplicationRecord
  # ----------------------------------------------------------------
  # 🔹 Validaciones básicas (aseguran calidad de datos importados)
  # ----------------------------------------------------------------
  
  validates :clinom, presence: true
  validates :nomprod, presence: true
  validates :trcan, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  # ----------------------------------------------------------------
  # 🔹 Callbacks útiles
  # ----------------------------------------------------------------
  before_save :normalize_fields

  # ----------------------------------------------------------------
  # 🔹 Constantes
  # ----------------------------------------------------------------
  POST = [
    "SM","PM","GTO","QUICK","SORZ","Ko","Xe","Buv","Lam",
    "Tipografia","Fidia","Baum","Duplo","C.Hilo","Binder",
    "Zechini","Alzadora","C.Alambre","T.Manual","Otros","Guillotina","Renz"
  ].freeze

  # ----------------------------------------------------------------
  # 🔹 Métodos de ayuda
  # ----------------------------------------------------------------

  # Devuelve una fecha legible para las vistas
  def formatted_deadline
    deadline&.strftime("%d/%m/%Y")
  end

  def formatted_trcar
    trcar&.strftime("%d/%m/%Y")
  end

  # ----------------------------------------------------------------
  # 🔹 Métodos privados
  # ----------------------------------------------------------------
  private

  # Normaliza texto para mantener consistencia
  def normalize_fields  
    self.papel   = papel.strip.titleize if papel.present?
  end
end
