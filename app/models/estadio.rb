class Estadio < ActiveRecord::Base
  # Asociaciones
	has_many :matches
	
	# Validaciones
  validates :nombre, presence: true, uniqueness: { :case_sensitive => false }
  validates :ciudad, presence: true, uniqueness: true, inclusion: { :in => ["Belo Horizonte", "Brasilia", "Cuiaba", "Curitiba", "Fortaleza", "Manaus", "Natal", "Recife", "Rio de Janeiro", "Salvador", "Sao Paulo"] }
  validates :fecha_construccion, presence: true
  validate :validar_fecha
  validates :capacidad, presence: true, numericality: { :only_integer => true, :greater_than => 0 }
  FORMATO_URL = /\A(www\.|http:\/\/).+\.(com|org|net)((\/|\.).*)?/
  validates :foto, presence: true, format: { :with => FORMATO_URL }
  
  def validar_fecha
    if(fecha_construccion.class != Time)
      if(fecha_construccion.class == Date)
        if(Date.valid_date?(fecha_construccion.year, fecha_construccion.month, fecha_construccion.day) == false)
          errors.add(:fecha_construccion, "Fecha invalida")
        end
      elsif(fecha_construccion.class == String)
        if(/\A\d{1,2}(\/|-)\d{1,2}(\/|-)(\d{2}|\d{4})\z/.match(fecha_construccion))
          temp = fecha_construccion.split("/")
          if(temp.length == 1)
            temp = fecha_construccion.split("-")
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
                  errors.add(:fecha_construccion, "Fecha invalida, febrero en año bisiesto solo tiene 29 dias")
                end
              else
                if(dia > 28)
                  errors.add(:fecha_construccion, "Fecha invalida, febrero en año normal solo tiene 28 dias")
                end
              end
            elsif(mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12)
              if(dia > 31)
                errors.add(:fecha_construccion, "Fecha invalida, el mes solo tiene 31 dias")
              end
            elsif(mes == 4 || mes == 6 || mes == 9 || mes == 11)
              if(dia > 30)
                errors.add(:fecha_construccion, "Fecha invalida, el mes solo tiene 30 dias")
              end
            end
          else
            errors.add(:fecha_construccion, "Fecha invalida")
          end
        else
          errors.add(:fecha_construccion, "Fecha invalida, formatos permitidos: dd/mm/yyyy, d/m/yy, dd-mm-yyyy, d-m-yy")
        end
      else 
        errors.add(:fecha_construccion, "Fecha invalida")
      end
    end
  end
end
