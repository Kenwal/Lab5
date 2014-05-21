class CreateEstadios < ActiveRecord::Migration
  def change
    create_table :estadios do |t|
      t.string :nombre
      t.string :ciudad
      t.date :fecha_construccion
      t.integer :capacidad
      t.string :foto

      t.timestamps
    end
  end
end
