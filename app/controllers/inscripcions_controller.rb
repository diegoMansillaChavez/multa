class InscripcionsController < ApplicationController
  before_action :set_inscripcion, only: [:show, :edit, :update, :destroy]

  # GET /inscripcions
  # GET /inscripcions.json
  def index
    @inscripcions = Inscripcion.all
  end

  # GET /inscripcions/1
  # GET /inscripcions/1.json
  def show
  end

  # GET /inscripcions/new
  def new
    @inscripcion = Inscripcion.new
  end

  # GET /inscripcions/1/edit
  def edit
  end

  # POST /inscripcions
  # POST /inscripcions.json
  def create
    @inscripcion = Inscripcion.new(inscripcion_params)

    respond_to do |format|
      if @inscripcion.save
        format.html { redirect_to @inscripcion, notice: 'Inscripcion was successfully created.' }
        format.json { render :show, status: :created, location: @inscripcion }
      else
        format.html { render :new }
        format.json { render json: @inscripcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscripcions/1
  # PATCH/PUT /inscripcions/1.json
  def update
    respond_to do |format|
      if @inscripcion.update(inscripcion_params)
        format.html { redirect_to @inscripcion, notice: 'Inscripcion was successfully updated.' }
        format.json { render :show, status: :ok, location: @inscripcion }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscripcions/1
  # DELETE /inscripcions/1.json
  def destroy
    @inscripcion.destroy
    respond_to do |format|
      format.html { redirect_to inscripcions_url, notice: 'Inscripcion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscripcion
      @inscripcion = Inscripcion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscripcion_params
      params.require(:inscripcion).permit(:fecha, :estudiante_id, :curso_id, :monto)
    end
end
