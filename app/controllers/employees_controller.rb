class EmployeesController < ApplicationController
	
	def index
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)

		if @employee.save
			session[:employee_id] = @employee.id
			flash[:notice] = "Successfully on Registration"
			redirect_to root_path
		else
			render :new
		end
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
