class RealtimeController < ApplicationController
  def index
  	@lastpower = Power.last
    @fecha= @lastpower[:created_at]
    @datos = Power.where({created_at: (@fecha-5.minutes)..(@fecha) })
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
    @lastpower = Power.last
    @fecha= @lastpower[:created_at]
    @datos = Power.where({created_at: (@fecha-5.minutes)..(@fecha) })
    render :partial => "/realtime/realtime"
  end

  def show
    @lastpower = Power.last
    @fecha= @lastpower[:created_at]
    @promedio = Power.where({created_at: (@fecha-5.minutes)..(@fecha) }).average(:value)
    @promedio = (@promedio/(1000.0)).round(4)
    @costo = @promedio*current_user.costo_kw
    render json: {ultimo: @lastpower, promedio: @promedio, costo: @costo }
  end

  def historics
    @todo = Power.last
    puts [:tiempo]

  end

  def historica
    @fecha1 = DateTime.strptime(params[:date][:ti], "%m/%d/%Y %I:%M %p")+Rational(5,24)
    @fecha2 = DateTime.strptime(params[:date][:tf], "%m/%d/%Y %I:%M %p")+Rational(5,24)
    @datos = Power.where(:created_at => (@fecha1..@fecha2))
    @tiempo = ((@datos.last.created_at - @datos.first.created_at)/1.hour)    
    @promedio = (@datos.average(:value)*@tiempo)/1000.0
    @costo = @promedio*current_user.costo_kw
  end
end