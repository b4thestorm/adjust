class EmployeesController < ApplicationController
	before_action :require_employee, only: [:show]
	

	def index
		@employees = Employee.all
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		#current_account.employees << Employee.new(employee_params)
		if @employee.save
			session[:employee_id] = @employee.id
			binding.pry
			flash[:success] = "Successfully Registered"
			redirect_to bulletin_path
		else
			flash[:danger] = "There is something wrong with your input"
			render :new
		end
	end

	def show
		@employee = @current_employee
		@shift = Shift.where(employee_id: @current_employee.id)
		@copyshifts = @shift.dup
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


def message_choice
	@employee = current_employee
	@employee.set_flag(params[:flag])
	flash[:success] = "Your notification type has been set"
	redirect_to employee_path(session[:employee_id])
end

def stop_request
	@employee = current_employee
	@employee.set_alert(params[:choice])
	flash[:success] = "Your notifications will stop" 
	redirect_to employee_path(session[:employee_id])
end


	private

	def employee_params
		params.require(:employee).permit(:username, :f_name, :l_name, :email, :authcode, :password)
	end
end
