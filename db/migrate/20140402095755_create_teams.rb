class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :nombre
      t.string :entrenador
      t.string :bandera
      t.string :uniforme
      t.text :historia

      t.timestamps
    end
  end
end
