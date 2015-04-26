 class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_employee, :logged_in?, :require_employee
  
    

   def current_employee
   	@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
   end

   def logged_in?
   	!!current_employee
   end

   def require_employee 
     if !logged_in?
   	 flash[:notice] = "Sorry Charlie"
   	 redirect_to root_path
     end
   end

    # def current_account
    #  Account.find_by_subdomain! request.subdomain  
    
    # end
    # helper_method :current_account

    # def scope_current_account
    #   if request.subdomain.empty? || request.subdomain.downcase == 'www'
    #     Account.current_id = nil
    #     yield
    #   else
    #     begin
    #       Account.current_id = current_account.subdomain
    #       yield
    #     rescue
    #       Account.current_id = nil
    #       redirect_to 'http://lvh.me:3000'
    #     end
    #   end
    # end
 

end
