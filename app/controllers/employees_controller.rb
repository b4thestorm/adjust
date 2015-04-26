class EmployeesController < ApplicationController
	before_action :require_employee, only: [:show]
	

	def index
	
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		#current_account.employees << Employee.new(employee_params)
		if @employee.save
			session[:employee_id] = @employee.id
			flash[:success] = "Successfully Registered"
			redirect_to bulletin_path
		else
			flash[:danger] = "Something wrong with your input"
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
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to root_path
	end

	private

	def employee_params
		params.require(:employee).permit(:username, :f_name, :l_name, :email, :authcode, :password)
	end
end
