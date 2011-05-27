class CalorieIntakesController < ApplicationController
  before_filter :authorize

  # GET /calorie_intakes
  # GET /calorie_intakes.xml
  #we need to comment
  def setup
    session[:user_id]=1
  end
  def index
    puts session[:username]
    Time.zone="Bucharest"
    start_date=Time.zone.now
    start_date=start_date-ONE_MONTH/2
    end_date =Time.zone.now+ 60*1000
    end_date= end_date
    @calorie_intakes = CalorieIntake.find_for_user_for_interval session[:user_id],start_date,end_date
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calorie_intakes }
    end
  end

  # GET /calorie_intakes/1
  # GET /calorie_intakes/1.xml
  def show
    
    @calorie_intake = CalorieIntake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calorie_intake }
    end
  end

  # GET /calorie_intakes/new
  # GET /calorie_intakes/new.xml
  def new
    @calorie_intake = CalorieIntake.new
    @user = User.find session[:user_id] unless session[:user_id]==nil
    @calorie_intake.user=@user
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calorie_intake }
    end
  end

  # GET /calorie_intakes/1/edit
  def edit
    @user = User.find session[:user_id] unless session[:user_id]==nil
    @calorie_intake = CalorieIntake.find(params[:id])
  end

  # POST /calorie_intakes
  # POST /calorie_intakes.xml
  def create
    @calorie_intake = CalorieIntake.new(params[:calorie_intake])
    @user = User.find session[:user_id] unless session[:user_id]==nil
    @calorie_intake.user=@user

    respond_to do |format|
      if @calorie_intake.save
        format.html { redirect_to(@calorie_intake, :notice => 'CalorieIntake was successfully created.') }
        format.xml  { render :xml => @calorie_intake, :status => :created, :location => @calorie_intake }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calorie_intake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calorie_intakes/1
  # PUT /calorie_intakes/1.xml
  def update
    @calorie_intake = CalorieIntake.find(params[:id])

    respond_to do |format|
      if @calorie_intake.update_attributes(params[:calorie_intake])
        format.html { redirect_to(@calorie_intake, :notice => 'CalorieIntake was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calorie_intake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calorie_intakes/1
  # DELETE /calorie_intakes/1.xml
  def destroy
    @calorie_intake = CalorieIntake.find(params[:id])
    @calorie_intake.destroy

    respond_to do |format|
      format.html { redirect_to(calorie_intakes_url) }
      format.xml  { head :ok }
    end
  end
end
