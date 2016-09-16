class User < ActiveRecord::Base
	#email regex
	validates_format_of :email, :with => /\A[^@]+@[^\.]+\.[^$]+\z/
	validates_presence_of :nome
	has_many :telefones
end
