class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nombre
      t.string :tipo
      t.text :descripcion
      t.date :fecha
      t.float :peso
      t.string :formato
      t.integer :id_materia

      t.timestamps
    end
  end
end
