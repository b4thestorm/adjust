class Employee < ActiveRecord::Base
	belongs_to :account
	has_many :shifts
	has_many :notifies
    has_secure_password validations: false
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, on: :create
	validates :email, :email_format => {message: 'needs valid email format'}
  
  
  


	def full_name 
		f_name + " " + l_name
	end



	# def self.scoped_to(account)
	# 	where(:account_id => account.id)
	# end	
end
