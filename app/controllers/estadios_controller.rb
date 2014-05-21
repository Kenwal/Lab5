class EstadiosController < ApplicationController
  respond_to :json
  
	def index
    @estadios = Estadio.all
    respond_with(@estadios)
	end
	
	def show
    @estadio = Estadio.find(params[:id])
    respond_with(@estadio)
	end
  
  def create
    @estadio = Estadio.new(params[:estadio])
    if @estadio.save
      flash[:notice] = "Estadio creado exitosamente"
    else
      flash[:notice] = "Estadio no pudo ser creado"
    end
	end
	
	def update
    @estadio = Estadio.find(params[:id])
    if @estadio.update_attributes(params[:estadio])  
      flash[:notice] = "Estadio actualizado exitosamente"
    else
      flash[:notice] = "Estadio no pudo ser actualizado"
    end
	end
	
	def delete
    @estadio = Estadio.find(params[:id])  
    if @estadio.destroy  
      flash[:notice] = "Estadio eliminado exitosamente"		
    else
      flash[:notice] = "Estadio no pudo ser eliminado"		
    end
  end
  
end
