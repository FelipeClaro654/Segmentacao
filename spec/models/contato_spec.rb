require "rails_helper"

RSpec.describe Contato, type: :model do
    context "Validade de Contato" do
        it "Contato válido?" do
            contato = Contato.new
            contato.nome = "Ryu"
            contato.email = "ryu"
            contato.idade = 22
            contato.cargo = "Lutador"
            contato.estado_id = 1
            expect(contato.valid?).to be_truthy
        end

        it "Contato válido?" do
            contato = Contato.new
            contato.nome = "Ryu"
            contato.email = "ryu"
            contato.idade = 22
            contato.cargo = "Lutador"
            contato.estado_id = "SP"
            expect(contato.valid?).to be_falsey
        end

        it "Contato válido?" do
            contato = Contato.new
            contato.nome = ""
            contato.idade = 0
            contato.cargo = ""
            contato.estado_id = ""
            expect(contato.valid?).to be_falsey
        end
    end
end
