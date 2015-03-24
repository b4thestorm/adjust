class ShiftsController < ApplicationController

def index
	@shifts = Shift.all
       
end

def show
@employee = current_employee
@shift = @employee.shifts.find(params[:id])
end

def new
@employee = current_employee
@shift = @employee.shifts.new
end

def create
@shift = current_employee.shifts.new(shift_params)
if @shift.save
	flash[:notice] = "New shift was added"
	redirect_to employee_shifts_path
else
	flash[:notice] = "Shift was not added"
	render 'new'
end
end

def destroy
	@employee = current_employee
	@shift = @employee.shifts.find(params[:id])
	@shift.destroy
	redirect_to root_path
end
private 
def shift_params
params.require(:shift).permit(:shift_day,:start,:end,:position,:employee_id)
end
 
end
