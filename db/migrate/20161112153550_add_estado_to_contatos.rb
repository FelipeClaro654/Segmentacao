class AddEstadoToContatos < ActiveRecord::Migration[5.0]
  def change
    add_reference :contatos, :estado, foreign_key: true
  end
end
