class CreateContatos < ActiveRecord::Migration[5.0]
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :email
      t.integer :idade
      t.string :cargo

      t.timestamps
    end
  end
end
