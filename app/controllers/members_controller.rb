class MembersController < ApplicationController



  def show
   @members = Member.all ##need to change this once the checkboxes to put in to select who to send it to
  end

  def index
    @members = Member.all
    if @members == nil
       flash[:notice] = "No members available."
    end
  end

  def new
  end

  def create
    @members = Member.create!(params[:member])
    redirect_to members_path
  end

end