class TeamsController < ApplicationController
	respond_to :json
  
	def index
		@teams = Team.all
    respond_with(@teams)
	end
	
	def show
    @team = Team.find(params[:id])
    respond_with(@team)
	end
	
	def create
    @team = Team.new(params[:team])
    if @team.save
      flash[:notice] = "Equipo creado exitosamente"
    else
      flash[:notice] = "Equipo no pudo ser creado"
    end
	end
	
	def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])  
      flash[:notice] = "Equipo actualizado exitosamente"
    else
      flash[:notice] = "Equipo no pudo ser actualizado"
    end
	end
	
	def delete
    @team = Team.find(params[:id])  
    if @team.destroy  
      flash[:notice] = "Equipo eliminado exitosamente"		
    else
      flash[:notice] = "Equipo no pudo ser eliminado"		
    end
  end
  
end
