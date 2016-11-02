class ConfiguracionesController < ApplicationController
  	def index
  		@user = current_user
	end
	def update
		@user = current_user
		@user.nombre = params[:nombre][0]
		@user.costo_kw = params[:costo_kw][0].to_f
		@user.estrato = params[:estrato][0]
		@user.save
		redirect_to '/configuraciones/index'
	end
end
