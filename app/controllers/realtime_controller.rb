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
    #puts params[:date][:ti]
    #d1 = DateTime.strptime(params[:date][0], "%m/%d/%Y %I:%M %p")
    #d=DateTime.civil(params[:tiempoi]["ti(1i)"].to_i,params[:tiempoi]["ti(2i)"].to_i, params[:tiempoi]["ti(3i)"].to_i, params[:tiempoi]["ti(4i)"].to_i, params[:tiempoi]["ti(5i)"].to_i, 0, 0)
    #puts d
    #puts d1
  end
end