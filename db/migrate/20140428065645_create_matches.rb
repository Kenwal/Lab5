class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :fecha
      t.integer :fase_id
      t.integer :estado_id
      t.integer :local_id
      t.integer :visitante_id
      t.string :marcador
      t.integer :ganador_id
      t.integer :perdedor_id
      t.string :empate
      t.integer :group_id
      t.integer :estadio_id

      t.timestamps
    end
  end
end
