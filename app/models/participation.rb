class Participation < ActiveRecord::Base
	# Asociaciones
	belongs_to :team
	belongs_to :group
	
	# Validaciones
	validates :team_id, presence: true, uniqueness: true
	validates :group_id, presence: true
	validates :puntos, presence: true, numericality: { :only_integer => true, :greater_than_or_equal_to => 0 }
	validates :pj, presence: true, numericality: { :only_integer => true, :greater_than_or_equal_to => 0 }
	validates :pg, presence: true, numericality: { :only_integer => true, :greater_than_or_equal_to => 0 }
	validates :pp, presence: true, numericality: { :only_integer => true, :greater_than_or_equal_to => 0 }
	validates :pe, presence: true, numericality: { :only_integer => true, :greater_than_or_equal_to => 0 }
	validates :gf, presence: true, numericality: { :only_integer => true, :greater_than_or_equal_to => 0 }
	validates :gc, presence: true, numericality: { :only_integer => true, :greater_than_or_equal_to => 0 }
	validate :validar_numero_partidos
	validate :validar_puntos
	validate :validar_goles
	
	def validar_numero_partidos
		if(pg != nil && pp != nil && pe != nil && pj != nil)
			if((pg + pp + pe) > pj)
				errors.add(:pj, "La suma de pg, pp y pe no puede ser mayor que pj")
			end
		end
	end
	
	def validar_puntos
		if(pg != nil && pe != nil && puntos != nil)
			if(((pg * 3) + pe) != puntos)
				errors.add(:puntos, "Los puntos no coinciden con la cantidad de pg y pe")
			end
		end
	end
	
	def validar_goles
		if(pj != nil && gf != nil && gc != nil)
			if(pj == 0)
				if(gf > 0)
					errors.add(:gf, "No pueden existir gf si no hay pj")
				end
				if(gc > 0)
					errors.add(:gc, "No pueden existir gc si no hay pj")
				end
			end
		end
	end
	
end
