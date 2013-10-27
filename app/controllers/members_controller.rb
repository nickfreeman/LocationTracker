class MembersController < ApplicationController



  def show
  end

  def index
    @members = Member.all
  end

  def new
  end

  def create
    @members = Member.create!(params[:member])
    redirect_to members_path
  end

end
