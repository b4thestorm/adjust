class AccountsController < ApplicationController


	def new
		@account = Account.new
		binding.pry
		@account.build_owner
	end

	def create 
		@account = Account.create(account_params)
		if @account.save 
		employee = Employee.last
		employee.update_attribute(:account_id, @account.id)
		flash[:success] = 'Your account has been successfully created.'
		end
		redirect_to login_url(:host => @account.subdomain + '.' + request.domain + request.port_string)
		
	end

	private
	
	def account_params
		params.require(:account).permit(:name, :subdomain, owner_attributes: [:email, :password, :f_name, :l_name, :username])
	end
	
end
