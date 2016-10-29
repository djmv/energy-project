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
    puts [:tiempo]

  end

  def historica
    puts [:tiempoi]
    puts "hola"
    puts [:tiempof]
    d=DateTime.civil(params[:tiempoi]["ti(1i)"].to_i,params[:tiempoi]["ti(2i)"].to_i, params[:tiempoi]["ti(3i)"].to_i, params[:tiempoi]["ti(4i)"].to_i, params[:tiempoi]["ti(5i)"].to_i, 0, 0)
    puts d
  end
end