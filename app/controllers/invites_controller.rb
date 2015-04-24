class InvitesController < ApplicationController

def create
    @invite = Invite.new(invite_params)
    if @invite.save 
      flash[:success] = "Thank You, You will recieve an email shortly."
    end
end

private
  def invite_params
    params.require(:invite).permit(:name,:email)
  end
end
