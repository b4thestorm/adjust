class EmployeesController < ApplicationController
	before_action :require_employee, only: [:show]
	around_filter :scope_current_account, only: [:show]

	def index
	
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params, account_id: current_account.id)

		#current_account.employees << Employee.new(employee_params)
		if @employee.save
			session[:employee_id] = @employee.id
			flash[:notice] = "Successfully Registered"
			redirect_to bulletin_url(:host => request.subdomain + '.' + request.domain + '.' + request.port_string)
		else
			render :new
		end
	end

	def show
		@employee = @current_employee
		@shift = @employee.shifts.all
	end

	def edit
	end

	def update
	end
	
	def destroy
	end

	private

	def employee_params
		params.require(:employee).permit(:username, :f_name, :l_name, :email, :password)
	end
end
