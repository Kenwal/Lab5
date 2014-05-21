class MatchesController < ApplicationController
  respond_to :json
  
	def index
    @matches = Match.all
    respond_with(@matches)
	end
	
	def show
    @match = Match.find(params[:id])
    respond_with(@match)
	end
  
  def create
    @match = Match.new(params[:match])
    if @match.save
      flash[:notice] = "Partido creado exitosamente"
    else
      flash[:notice] = "Partido no pudo ser creado"
    end
	end
	
	def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])  
      flash[:notice] = "Partido actualizado exitosamente"
    else
      flash[:notice] = "Partido no pudo ser actualizado"
    end
	end
	
	def delete
    @match = Match.find(params[:id])  
    if @match.destroy  
      flash[:notice] = "Partido eliminado exitosamente"		
    else
      flash[:notice] = "Partido no pudo ser eliminado"		
    end
  end
  
end
