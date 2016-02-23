class Api::ProductsController < ApplicationController
  before_action :set_api_product, only: [:show, :edit, :update, :destroy]

  # GET /api/products
  # GET /api/products.json
  def index
    if params[:supermarket]
      @products_supermarket = Api::ProductSupermarket.where(supermarket_id: params[:supermarket])
      if @products_supermarket
        products = []
        @products_supermarket.each do |supermarket|
          products << supermarket.product
        end
        render json: {products: products}, status: 202
      else
        render json: {error: 'Products not found'}, status: 404
      end
    else
      @api_products = Api::Product.all
      render json: @api_products, status: 202
    end
  end

  # GET /api/products/1
  # GET /api/products/1.json
  def show
  end

  # GET /api/products/new
  def new
    @api_product = Api::Product.new
  end

  # GET /api/products/1/edit
  def edit
  end

  # POST /api/products
  # POST /api/products.json
  def create
    @api_product = Api::Product.new(api_product_params)

    respond_to do |format|
      if @api_product.save
        format.json { render :show, status: :created, location: @api_product }
      else
        format.json { render json: @api_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/products/1
  # PATCH/PUT /api/products/1.json
  def update
    respond_to do |format|
      if @api_product.update(api_product_params)
        format.json { render :show, status: :ok, location: @api_product }
      else
        format.html { render :edit }
        format.json { render json: @api_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/products/1
  # DELETE /api/products/1.json
  def destroy
    @api_product.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_product
      @api_product = Api::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_product_params
      params.require(:api_product).permit(:name, :price, :image)
    end
end
