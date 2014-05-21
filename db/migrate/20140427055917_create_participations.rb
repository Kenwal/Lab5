class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :team_id
      t.integer :group_id
      t.integer :puntos
      t.integer :pj
      t.integer :pg
      t.integer :pp
      t.integer :pe
      t.integer :gf
      t.integer :gc

      t.timestamps
    end
  end
end
