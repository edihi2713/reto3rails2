class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: {message: "Guardado exitsamente"}, status: 201
    else
      render json:  { errors: @product.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @produc.destroy
     render json: { message: "Eliminado exitosamente" }, status: 204
  end


  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      render "api/v1/products/show"
    else
      render json:  { errors: @product.errors.full_messages } , status: 422
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
