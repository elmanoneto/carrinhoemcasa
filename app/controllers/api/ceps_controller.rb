class Api::CepsController < Api::BaseController
  before_action :set_api_cep, only: [:show, :edit, :update, :destroy]

  # GET /api/ceps
  # GET /api/ceps.json
  def index
    if params[:cep]
      @api_ceps = Api::Cep.find_by(cep: params[:cep])
      if @api_ceps
        render json: {ceps: @api_ceps}, status: 202
      else
        render json: {error: 'CEP not found'}, status: 404
      end
    else
      @api_ceps = Api::Cep.all
      render json: {ceps: @api_ceps}, status: 202
    end
  end

  # GET /api/ceps/1
  # GET /api/ceps/1.json
  def show
  end

  # GET /api/ceps/new
  def new
    @api_cep = Api::Cep.new
  end

  # GET /api/ceps/1/edit
  def edit
  end

  # POST /api/ceps
  # POST /api/ceps.json
  def create
    @api_cep = Api::Cep.new(api_cep_params)

    respond_to do |format|
      if @api_cep.save
        format.json { render :show, status: :created, location: @api_cep }
      else
        format.json { render json: @api_cep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/ceps/1
  # PATCH/PUT /api/ceps/1.json
  def update
    respond_to do |format|
      if @api_cep.update(api_cep_params)
        format.json { render :show, status: :ok, location: @api_cep }
      else
        format.json { render json: @api_cep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/ceps/1
  # DELETE /api/ceps/1.json
  def destroy
    @api_cep.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_cep
      @api_cep = Api::Cep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_cep_params
      params.require(:api_cep).permit(:cep, :street, :neighborhood, :city, :state)
    end
end
