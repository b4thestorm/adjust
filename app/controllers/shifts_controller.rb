class ShiftsController < ApplicationController
	include ShiftsHelper
	before_action :check_if_allowed, only: [:notify]

def index
	# paginate(:page => params[:page], :per_page => 5)
	# @shift = Employee.where(id: session[:employee_id]).take
	@shifts = Shift.all
	@new_instance = Shift.new
	if params[:week]
	@container = @new_instance.weeks(params[:week])
	end
	if params[:day]
	@shifts = Shift.find_by_sql(["SELECT * FROM shifts WHERE shift_day = ?", params[:day] ])
	end
end

def show
@employee = current_employee
@shift = @employee.shifts.find(params[:id])
@wants = @shift.coworkers
end

def new
@employee = current_employee
@shift = Shift.new
end

def create
@shift = Shift.new(shift_params)
 if @shift.save!
 	@shift.employee_id = current_employee.id
 	@shift.save
 	flash[:success] = "New shift was added"
	redirect_to employee_shifts_path
  else
	flash[:danger] = "Shift was not added"
	render 'new'
 end
end

def destroy
	@employee = current_employee
	@shift = @employee.shifts.find(params[:id])
	@shift.destroy
	redirect_to employee_shifts_path
end

def notify
	@user = current_employee
	@shift = Shift.find(params[:id])
	if @shift.coworkers <<  @user
		if current_employee.flag == 'email'
		flash[:success] = 'Your Request has been sent'
		ShiftMailer.shift_notify(@shift, @user).deliver
		redirect_to :back
		elsif current_employee.flag == 'text_message'
		flash[:success] = 'Your Request has been sent'
		@shift_request = ShiftRequest.new
		@shift_request.user_num = @user.id
		@shift_request.shift_num = @shift.id
		@shift_request.save
		redirect_to :back
		else 
		redirect_to :back 
		end
  end
end

def accept
	if params[:true]
	@employee = Shift.find(params[:id])
	coworker = @employee.coworkers.match
	end
end


private 
def shift_params
params.require(:shift).permit(:shift_day,:start,:end,:position)
end

def check_if_allowed
	if Employee.where(id: params[:employee_id]).take.alert == 'yes'
		flash[:success] = "This user has stopped taking requests"
		redirect_to :back
	else
		return true  
	end 
end

end

