class User < ActiveRecord::Base
	#email regex
	validates_format_of :email, :with => /\A[^@]+@[^\.]+\.[^$]+\z/
	validates_presence_of :nome
	validates_uniqueness_of :email
	has_one :endereco, autosave: true
end
