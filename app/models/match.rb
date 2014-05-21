class Match < ActiveRecord::Base
	# Asociaciones
	belongs_to :local, :class_name => 'Team', :foreign_key => 'local_id'
	belongs_to :visitante, :class_name => 'Team', :foreign_key => 'visitante_id'
	belongs_to :estadio
	belongs_to :ganador, :class_name => 'Team', :foreign_key => 'ganador_id'
	belongs_to :perdedor, :class_name => 'Team', :foreign_key => 'perdedor_id'
	belongs_to :group
	belongs_to :fase
  belongs_to :estado

	# Validaciones
  validates :fecha, presence: true, uniqueness: { scope: :estadio_id }
  validate :validar_fecha
  validates :fase_id, presence: true, inclusion: { :in => [1, 2, 3, 4, 5] }
  validates :estado_id, presence: true, inclusion: { :in => [1, 2, 3] }
  validates :local_id, presence: true, uniqueness: { scope: :fecha }
  validates :visitante_id, presence: true, uniqueness: { scope: :fecha }
  validate :validar_visitante
  validates :marcador, presence: true, format: { :with => /\A\d+-\d+\z/ }
	validates :ganador_id, presence: true, if: :no_empate?
	validate :validar_ganador
	validates :perdedor_id, presence: true, if: :no_empate?
	validate :validar_perdedor
  validates :empate, presence: true, if: :empate?
  validates :estadio_id, presence: true
  
  def validar_fecha
    if(fecha.class != Time)
      if(fecha.class == Date)
        if(Date.valid_date?(fecha.year, fecha.month, fecha.day) == false)
          errors.add(:fecha, "Fecha invalida")
        end
      elsif(fecha.class == String)
        if(/\A\d{1,2}(\/|-)\d{1,2}(\/|-)(\d{2}|\d{4})\z/.match(fecha))
          temp = fecha.split("/")
          if(temp.length == 1)
            temp = fecha.split("-")
          end
          dia = temp[0]
          mes = temp[1]
          año = temp[2]
          bisiesto = false
          if(año % 4 == 0 && (año % 100 != 0 || año % 400 == 0))
            bisiesto = true
          end
          if(dia > 0 && (mes > 0 && mes <= 12))
            if(mes == 2)
              if(bisiesto)
                if(dia > 29)
                  errors.add(:fecha, "Fecha invalida, febrero en año bisiesto solo tiene 29 dias")
                end
              else
                if(dia > 28)
                  errors.add(:fecha, "Fecha invalida, febrero en año normal solo tiene 28 dias")
                end
              end
            elsif(mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12)
              if(dia > 31)
                errors.add(:fecha, "Fecha invalida, el mes solo tiene 31 dias")
              end
            elsif(mes == 4 || mes == 6 || mes == 9 || mes == 11)
              if(dia > 30)
                errors.add(:fecha, "Fecha invalida, el mes solo tiene 30 dias")
              end
            end
          else
            errors.add(:fecha, "Fecha invalida")
          end
        else
          errors.add(:fecha, "Fecha invalida, formatos permitidos: dd/mm/yyyy, d/m/yy, dd-mm-yyyy, d-m-yy")
        end
      else 
        errors.add(:fecha, "Fecha invalida")
      end
    end
  end
  
  def validar_visitante
    if(local_id == visitante_id)
      errors.add(:visitante_id, "Equipo visitante debe ser distinto del local")
    end
  end
			
	def validar_ganador
		if(ganador_id != nil && local_id != nil && visitante_id != nil)
			if(ganador_id != local_id && ganador_id != visitante_id)
				errors.add(:ganador_id, "El ganador solo puede ser el equipo local o el visitante")
			end
		end
	end
			
	def validar_perdedor
		if(perdedor_id != nil && local_id != nil && visitante_id != nil && ganador_id != nil)
			if(perdedor_id == ganador_id)
				errors.add(:perdedor_id, "El perdedor no puede ser el mismo que el ganador")
			elsif(perdedor_id != local_id && perdedor_id != visitante_id)
				errors.add(:perdedor_id, "El perdedor solo puede ser el equipo local o el visitante")
			end
		end
	end
  
  def no_empate?
    res = false
    if(estado_id == 3)
      if(marcador.class == String)
        temp = marcador.split("-")
        if(temp[0] != temp[1])
          res = true
        end
      end
    end
    res
  end
  
  def empate?
    res = false
		if(estado_id == 3)
			if(marcador.class == String)
				temp = marcador.split("-")
				if(temp[0] == temp[1])
					res = true
				end
			end
		end
    res
  end
  
end
