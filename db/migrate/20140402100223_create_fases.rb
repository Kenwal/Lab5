class CreateFases < ActiveRecord::Migration
  def change
    create_table :fases do |t|
      t.string :fase

      t.timestamps
    end
  end
end
