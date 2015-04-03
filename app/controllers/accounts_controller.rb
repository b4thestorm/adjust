class AccountsController < ApplicationController

	def new
		@account = Account.new
		@account.build_owner
	end

	def create 
		@account = Account.create(account_params)
		flash[:success] = 'Your account has been successfully created.'
		redirect_to root_url
	end

	private
	
	def account_params
		params.require(:account).permit(:name)
	end
end
