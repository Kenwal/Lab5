class Group < ActiveRecord::Base
  # Asociaciones
	has_many :participations
	has_many :teams, through: :participations
	has_many :matches
	
	# Validaciones
  validates :nombre, presence: true, format: { :with => /\A[a-zA-Z]\z/ }, uniqueness: { :case_sensitive => false }
end
