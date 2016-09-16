class Telefone < ActiveRecord::Base
	#formato basico de telefone
	validates_format_of :numero, :with => /\A[0-9]{8,9}\z/
end
