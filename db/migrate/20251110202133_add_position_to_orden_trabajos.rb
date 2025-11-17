class AddPositionToOrdenTrabajos < ActiveRecord::Migration[8.0]
  def change
    add_column :orden_trabajos, :position, :integer
  end
end
