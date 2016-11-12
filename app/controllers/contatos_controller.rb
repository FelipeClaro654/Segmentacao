class ContatosController < ApplicationController
    before_action :set_contato, only: [:show, :edit, :update, :destroy]

    # GET /contatos
    # GET /contatos.json
    def index
        @historico_segmentacao = HistoricoSegmentacao.all.order(updated_at: :desc)
        call_contatos(params)
    end

    # GET /contatos/1
    # GET /contatos/1.json
    def show
    end

    # GET /contatos/new
    def new
        @contato = Contato.new
    end

    # GET /contatos/1/edit
    def edit
    end

    def render_lista
        @historico = HistoricoSegmentacao.find(params[:historico_id])
        @contatos = Contato.atualiza_lista(@historico)
        render partial: "list", locals:{contatos: @contatos}
    end

    def call_contatos(params)
        if params[:f_nome].present? ||
            params[:f_email].present? ||
            params[:f_cargo].present? ||
            params[:f_idade].present? ||
            params[:f_estado].present?

            @contatos = Contato.search(params)
            if params[:historico_id].present?
                @historico_id = params[:historico_id]
            end
        else
            @contatos = Contato.all
        end
    end

    # POST /contatos
    # POST /contatos.json
    def create
        @contato = Contato.new(contato_params)

        respond_to do |format|
            if @contato.save
                format.html { redirect_to @contato, notice: 'Contato was successfully created.' }
                format.json { render :show, status: :created, location: @contato }
            else
                format.html { render :new }
                format.json { render json: @contato.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /contatos/1
    # PATCH/PUT /contatos/1.json
    def update
        respond_to do |format|
            if @contato.update(contato_params)
                format.html { redirect_to @contato, notice: 'Contato was successfully updated.' }
                format.json { render :show, status: :ok, location: @contato }
            else
                format.html { render :edit }
                format.json { render json: @contato.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /contatos/1
    # DELETE /contatos/1.json
    def destroy
        @contato.destroy
        respond_to do |format|
            format.html { redirect_to contatos_url, notice: 'Contato was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contato
        @contato = Contato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contato_params
        params.require(:contato).permit(:nome, :email, :idade, :estado_id, :cargo)
    end
end
