class Api::SupermarketsController < ApplicationController
  before_action :set_api_supermarket, only: [:show, :edit, :update, :destroy]

  # GET /api/supermarkets
  # GET /api/supermarkets.json
  def index
    if params[:cep]
      @cep_supermarkets = Api::CepSupermarket.where(cep_id: params[:cep])
      if @cep_supermarkets
        supermarkets = []
        @cep_supermarkets.each do |cep|
          supermarkets << cep.supermarket
        end
        render json: {supermarkets: supermarkets}, status: 202
      else
        render json: {error: 'Supermarkets not found'}, status: 404
      end
    else
      @api_supermarkets = Api::Supermarket.all
      render json: @api_supermarkets, status: 202
    end
  end

  # GET /api/supermarkets/1
  # GET /api/supermarkets/1.json
  def show
  end

  # GET /api/supermarkets/new
  def new
    @api_supermarket = Api::Supermarket.new
  end

  # GET /api/supermarkets/1/edit
  def edit
  end

  # POST /api/supermarkets
  # POST /api/supermarkets.json
  def create
    @api_supermarket = Api::Supermarket.new(api_supermarket_params)

    respond_to do |format|
      if @api_supermarket.save
        format.json { render :show, status: :created, location: @api_supermarket }
      else
        format.json { render json: @api_supermarket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/supermarkets/1
  # PATCH/PUT /api/supermarkets/1.json
  def update
    respond_to do |format|
      if @api_supermarket.update(api_supermarket_params)
        format.json { render :show, status: :ok, location: @api_supermarket }
      else
        format.json { render json: @api_supermarket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/supermarkets/1
  # DELETE /api/supermarkets/1.json
  def destroy
    @api_supermarket.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_supermarket
      @api_supermarket = Api::Supermarket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_supermarket_params
      params.require(:api_supermarket).permit(:name, :description, :everyday, :image)
    end
end
