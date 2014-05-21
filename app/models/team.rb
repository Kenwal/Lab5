class Team < ActiveRecord::Base
	# Asociaciones
	has_one :participation
	has_one :group, through: :participation
	has_many :locales, :class_name => 'Match', :foreign_key => 'local_id'
	has_many :visitantes, :class_name => 'Match', :foreign_key => 'visitante_id'
	has_many :ganados, :class_name => 'Match', :foreign_key => 'ganador_id'
	has_many :perdidos, :class_name => 'Match', :foreign_key => 'perdedor_id'
	
	# Validaciones
  validates :nombre, presence: true, format: { :with => /\A[a-zA-Z]+\z/ }, uniqueness: { :case_sensitive => false }
  validates :entrenador, presence: true, uniqueness: { :case_sensitive => false }
  FORMATO_URL = /\A(www\.|http:\/\/).+\.(com|org|net)((\/|\.).*)?/
  validates :bandera, presence: true, format: { :with => FORMATO_URL }
  validates :uniforme, presence: true, format: { :with => FORMATO_URL }
  validates :historia, presence:true, :length => { :minimum => 15, :maximum => 200 }
end