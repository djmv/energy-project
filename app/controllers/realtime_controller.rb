class RealtimeController < ApplicationController
  def index
  	@lastpower = Power.last
  end

  def add
  	@newpower = Power.new value: params[:value]
  	if @newpower.save
  		@message = 'Añadido correctamente'
  	else
  		@message = 'No se pudo añadir'
  	end
  end

  def refresh_part
    render :partial => "/realtime/realtime"
  end
end