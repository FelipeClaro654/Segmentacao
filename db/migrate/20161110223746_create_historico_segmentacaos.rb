class CreateHistoricoSegmentacaos < ActiveRecord::Migration[5.0]
  def change
    create_table :historico_segmentacaos do |t|
      t.string :f_nome
      t.string :f_tipo_nome
      t.string :f_clause_nome
      t.string :f_email
      t.string :f_tipo_email
      t.string :f_clause_email
      t.integer :f_idade
      t.string :f_tipo_idade
      t.string :f_clause_idade
      t.string :f_cargo
      t.string :f_tipo_cargo
      t.string :f_clause_cargo
      t.integer :f_estado
      t.timestamps
    end
  end
end
