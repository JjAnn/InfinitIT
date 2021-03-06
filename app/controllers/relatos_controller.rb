class RelatosController < ApplicationController
  before_action :set_relato, only: [:show, :edit, :update, :destroy]



  # GET /relatos
  # GET /relatos.json


  def getlocal
    location = request.location
  end

  def ip_address
    ip_address = request.remote_ip
  end

  def index
    @relatos = Relato.all
    authorize! :read, Relato
  end

  # GET /relatos/1
  # GET /relatos/1.json
  def show
 
  end

  # GET /relatos/new
  def new
    @relato = Relato.new
    @relatos = Relato.all
  @relatos1 = Relato.where(isdoe: false)
@relatos2 = Relato.where(isdoe: true)
@reltask = Reltask.new
@projeto = Projeto.where(projeto_id: :id)
     @conditional = Conditional.new
 @conditionals = Conditional.all
  end

  # GET /relatos/1/edit
  def edit
@reltask = Reltask.new
@relato = Relato.find(params[:id])
@reltask1 = Reltask.all
 @relatos1 = Relato.where(isdoe: false)
@relatos2 = Relato.where(isdoe: true)
@projeto1 = Relato.find(params[:id])
  end

  # POST /relatos
  # POST /relatos.json
  def create
    @relato = Relato.new(relato_params)
    respond_to do |format|
      if @relato.save
        format.html { redirect_to '/relatorio', notice: 'Relato was successfully created.' }
        format.json { render :new, status: :created, location: @relato }
      else
        format.html { render :new }
        format.json { render json: @relato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatos/1
  # PATCH/PUT /relatos/1.json
  def update
@reltask = Reltask.new

    respond_to do |format|
      if @relato.update(relato_params)
        format.html { redirect_to '/relatorio', notice: 'Relatório finalizado com sucesso!' }
        format.json { respond_with @relato }
      else
        format.html { render :edit }
        format.json { render json: @relato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatos/1
  # DELETE /relatos/1.json
  def destroy
    @relato.destroy
    respond_to do |format|
      format.html { redirect_to relatos_url, notice: 'Relato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relato
      @relato = Relato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relato_params
      params.require(:relato).permit(:id, :cliente_id, :projeto_id, :local_id, :task_id, :time, :comment, :isdoe, :user_id, :latitude, :longitude, :ip_address, :getlocal, :reltasks_attributes => [:projeto_id, :reltask_id, :task_id, :relato_id, :_destroy, :comentario, :id, :tempo, :isdoe, :user_id, :latitude, :longitude, :ip_address, :getlocal])
    end
end
