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
    @fecha= @lastpower[:created_at]
    @promedio = Power.where({created_at: (@fecha-5.minutes)..(@fecha) }).average(:value)
    @promedio = (@promedio/(1000.0)).round(4)
    render json: {ultimo: @lastpower, promedio: @promedio }
  end

  def historics
    @todo = Power.last
    puts [:tiempo]

  end

  def historica
    @fecha1 = DateTime.strptime(params[:date][:ti], "%m/%d/%Y %I:%M %p")+Rational(5,24)
    @fecha2 = DateTime.strptime(params[:date][:tf], "%m/%d/%Y %I:%M %p")+Rational(5,24)
    @tiempo = ((@fecha2 - @fecha1)*24)
    @datos = Power.where(:created_at => (@fecha1..@fecha2))
    @promedio = (@datos.average(:value)*@tiempo)/1000.0

    #puts params[:date][:ti]
    #d1 = DateTime.strptime(params[:date][0], "%m/%d/%Y %I:%M %p")
    #d=DateTime.civil(params[:tiempoi]["ti(1i)"].to_i,params[:tiempoi]["ti(2i)"].to_i, params[:tiempoi]["ti(3i)"].to_i, params[:tiempoi]["ti(4i)"].to_i, params[:tiempoi]["ti(5i)"].to_i, 0, 0)
    #puts d
    #puts d1
  end
end