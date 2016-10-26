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

  def show
    @lastpower = Power.last
    render json: @lastpower
  end

  def historics
    @todo = Power.last
  end

  def historica
    render :partial => "/realtime/historic", :locals => {:fechai => 36}
  end
end