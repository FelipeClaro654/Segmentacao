class Contato < ApplicationRecord
    belongs_to :estado
    validates :nome, presence: true
    validates :email, uniqueness: true, presence: true
    validates :idade, presence: true
    validates :cargo, presence: true

    def self.search(params)
        nome = ""
        email = ""
        idade = ""
        cargo = ""
        estado = ""

        if params[:f_nome].present?
            case params[:f_tipo_nome]
            when "Igual a"
                nome = "nome = '#{params[:f_nome]}'"
            when "Contém"
                nome = "nome LIKE '%#{params[:f_nome]}%'"
            when "Começa com"
                nome = "nome LIKE '%#{params[:f_nome]}'"
            else
                nome = "nome LIKE '#{params[:f_nome]}%'"
            end
        else
            params[:f_clause_nome] = ""
        end

        params[:f_clause_nome].nil? ? nome += "" : nome += params[:f_clause_nome]

        if params[:f_email].present?
            case params[:f_tipo_email]
            when "Igual a"
                email = " email = '#{params[:f_email]}'"
            when "Contém"
                email = " email LIKE '%#{params[:f_email]}%'"
            when "Começa com"
                email = " email LIKE '%#{params[:f_email]}'"
            else
                email = " email LIKE '#{params[:f_email]}%'"
            end
        else
            params[:f_clause_email] = ""
        end

        params[:f_clause_email].nil? ? email += "" : email += params[:f_clause_email]

        if params[:f_cargo].present?

            case params[:f_tipo_cargo]
            when "Igual a"
                cargo = " cargo = '#{params[:f_cargo]}'"
            when "Contém"
                cargo = " cargo LIKE '%#{params[:f_cargo]}%'"
            when "Começa com"
                cargo = " cargo LIKE '%#{params[:f_cargo]}'"
            else
                cargo = " cargo LIKE '#{params[:f_cargo]}%'"
            end
        else
            params[:f_clause_cargo] = ""
        end

        params[:f_clause_cargo].nil? ? cargo += "" : cargo += params[:f_clause_cargo]


        if params[:f_idade].present?
            case params[:f_tipo_idade]
            when "="
                idade = " idade = #{params[:f_idade]}"
            when "<"
                idade = " idade < #{params[:f_idade]}"

            when "<="
                idade = " idade <= #{params[:f_idade]}"
            when ">"
                idade = " idade > #{params[:f_idade]}"
            else
                idade = " idade >= #{params[:f_idade]}"
            end
        else
            params[:f_clause_idade] = ""
        end

        params[:f_clause_idade].nil? ? idade += "" : idade += params[:f_clause_idade]

        if params[:f_estado].present?
            estado = "estado_id = #{params[:f_idade]}"
        end

        segmentacao = nome + email + cargo + idade + estado
        if params[:historico_id].blank?
            salva_segmentacao(params)
        else
            editar_segmentacao(params)
        end
        where(segmentacao)
    end

    def self.salva_segmentacao(params)
        @historico_segmentacao = HistoricoSegmentacao.new(
                                                            nome: params[:f_nome],
                                                            tipo_nome: params[:f_tipo_nome],
                                                            clause_nome: params[:f_clause_nome],
                                                            email: params[:f_email],
                                                            tipo_email: params[:f_tipo_email],
                                                            clause_email: params[:f_clause_email],
                                                            idade: params[:f_idade],
                                                            tipo_idade: params[:f_tipo_idade],
                                                            clause_idade: params[:f_clause_idade],
                                                            cargo: params[:f_cargo],
                                                            tipo_cargo: params[:f_tipo_cargo],
                                                            clause_cargo: params[:f_clause_cargo],
                                                            estado: params[:f_estado]
                                                        )
        @historico_segmentacao.save
    end

    def self.editar_segmentacao(params)
        @edicao_historico = HistoricoSegmentacao.find(params[:historico_id])
        @edicao_historico.update_attributes(
                                    nome: params[:f_nome],
                                    tipo_nome: params[:f_tipo_nome],
                                    clause_nome: params[:f_clause_nome],
                                    email: params[:f_email],
                                    tipo_email: params[:f_tipo_email],
                                    clause_email: params[:f_clause_email],
                                    idade: params[:f_idade],
                                    tipo_idade: params[:f_tipo_idade],
                                    clause_idade: params[:f_clause_idade],
                                    cargo: params[:f_cargo],
                                    tipo_cargo: params[:f_tipo_cargo],
                                    clause_cargo: params[:f_clause_cargo],
                                    estado: params[:f_estado]
                                    )
        @edicao_historico.save
    end
end
