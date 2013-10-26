class MembersController < ApplicationController

  def show
  end

  def index
  end

  def new
  end

  def create
    @member = Movie.create!(params[:member])
  end
