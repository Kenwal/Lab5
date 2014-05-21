class GroupsController < ApplicationController
  respond_to :json
  
	def index
    @groups = Group.all
    respond_with(@groups)
	end
	
	def show
    @group = Group.find(params[:id])
    respond_with(@group)
	end
  
  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:notice] = "Grupo creado exitosamente"
    else
      flash[:notice] = "Grupo no pudo ser creado"
    end
	end
	
	def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])  
      flash[:notice] = "Grupo actualizado exitosamente"
    else
      flash[:notice] = "Grupo no pudo ser actualizado"
    end
	end
	
	def delete
    @group = Group.find(params[:id])  
    if @group.destroy  
      flash[:notice] = "Grupo eliminado exitosamente"		
    else
      flash[:notice] = "Grupo no pudo ser eliminado"		
    end
  end
  
end
