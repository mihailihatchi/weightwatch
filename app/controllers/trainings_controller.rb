require 'training'
class TrainingsController < ApplicationController
  before_filter :authorize
  def index
    logger.info 'loading trainings ..'
    @trainings= Training.find_for_user session[:user_id]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trainings }
    end
    logger.info 'trainings loaded'
  end
  def create
    @training = Training.new(params[:training])
    @user= User.find session[:user_id] unless session[:user_id]==nil
    @training.user=@user
    @training.user_id=session[:user_id]
    respond_to do |format|
      #load the current user


      if @training.save
        format.html { redirect_to(@training, :notice => 'Weight was successfully created.') }
        format.xml  { render :xml => @training, :status => :created, :location => @training }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
      end
    end
  end
  def new
    @users= User.all
    @training =Training.new
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to(trainings_url) }
      format.xml  { head :ok }
    end
  end

  def show
    @training = Training.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @training }
    end
  end
  #this method is called on
  #get to the edit form
  def edit
    @training = Training.find(params[:id])
    @user= User.find @training.user_id
  end
  def update
    @training = Training.find(params[:id])
    
    respond_to do |format|
      if @training.update_attributes(params[:training])
        format.html { redirect_to(@training, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
      end
    end
  end
end