class CreateHistoricoSegmentacaos < ActiveRecord::Migration[5.0]
  def change
    create_table :historico_segmentacaos do |t|
      t.string :nome
      t.string :tipo_nome
      t.string :clause_nome
      t.string :email
      t.string :tipo_email
      t.string :clause_email
      t.integer :idade
      t.string :tipo_idade
      t.string :clause_idade
      t.string :cargo
      t.string :tipo_cargo
      t.string :clause_cargo

      t.timestamps
    end
  end
end
