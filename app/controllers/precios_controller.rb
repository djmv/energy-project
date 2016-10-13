class PreciosController < ApplicationController
  def index
  	@product = Product.new
  	@product.precio = params[:status]
  	puts params[:status]
  	@product.save
  end

  def obtener
  	@product = Power.last
  end
end
