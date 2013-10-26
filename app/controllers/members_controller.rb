class MembersController < ApplicationController


  def response
 
  end
  def show
  end

  def index
  end

  def new
  end

  def create
    @member = Member.create!(params[:member])
  end
end
