class MembersController < ApplicationController

  def show
  end

  def index
    @members = User.all
    #sort by name, ascending then descending
    if (params[:sort] == 'name')
		if ((not session[:sort_name]) or session[:sort_name] == 'ascend')
			@members = User.find(:all, :order => 'name ASC')
			session[:sort_name] = 'descend'
		else
			@members = User.find(:all, :order => 'name DESC')
			session[:sort_name] = 'ascend'
		end
	end
	#sort by email, ascending then descending
	if (params[:sort] == 'email')
		if ((not session[:sort_email]) or session[:sort_email] == 'ascend')
			@members = User.find(:all, :order => 'email ASC')
			session[:sort_email] = 'descend'
		else
			@members = User.find(:all, :order => 'email DESC')
			session[:sort_email] = 'ascend'
		end
	end
	
	
	
  end

  def new
  end

  def create
    @members = User.create!(params[:member])
    redirect_to members_path
  end


  def email		
    #if params[:members_all]
      #@members = User.all
    #else
      @members_temp = (params[:members]? params[:members].keys : [])
		  @members = User.find(:all, :conditions => {:name => @members_temp})
    #end

		#puts @members.length
		if @members.length == 0
			flash[:notice] = "No members available"
			redirect_to "/members"
		else
			@members.each do |member|
				UserMailer.seek_email(member).deliver
			end
			redirect_to success_members_path(:members => params[:members], :members_all => params[:members_all])
		end
  end
	
  def success
    if params[:members_all]
      @members = User.all
    else
      @members_temp = (params[:members]? params[:members].keys : [])
		  @members = User.find(:all, :conditions => {:name => @members_temp})
    end
  end

end
