class StoreController < ApplicationController
  def new
  	@store = Store.new
  end

  def create
  	@store = Store.new(store_params)
  	if @store.save 
  		flash[:notice] = "Store Added"
  		redirect_to store_path 
  	else
  		flash[:notice] = "Unsuccessful add"
  		render 'new'
  	end
  end

  def show
  end

  def destroy
  end

private 
	def store_params
		params.require(:store).permit()
	end	
end
