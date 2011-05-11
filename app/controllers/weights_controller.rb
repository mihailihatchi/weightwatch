require 'gchart'
class WeightsController < ApplicationController
  before_filter :authorize
 
      
  # GET /weights
  # GET /weights.xml
  def index
    @role=session[:user_role]
    if @role=='admin'
      @weights = Weight.all
    else
      start_date=Time.now
      start_date=start_date-ONE_MONTH
      end_date =Time.now
      @weights = Weight.find_for_user_for_interval session[:user_id],start_date,end_date
      create_chart unless (@weights==nil or @weights.empty?)
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weights }
    end
  end

  # GET /weights/1
  # GET /weights/1.xml
  def show
    @weight = Weight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weight }
    end
  end

  # GET /weights/new
  # GET /weights/new.xml
  def new
    @weight = Weight.new
    @user= @logged_user unless @logged_user==nil

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weight }
    end
  end
  def create_chart
    @data =[];
    @time_labels=[]
    @weights.each{  |weight|  @data.push(weight.weight.to_f)}
    @weights.each{  |weight|  @time_labels.push(weight.weighting_date)}
    @max_weight=@data.max

    @min_weight=@data.min

    @diff =@max_weight-@min_weight
    @hacked_data=[]
    @data.each {|d| @hacked_data.push(d-@min_weight) }
    min_date = @time_labels.min
    max_date =@time_labels.max
    diff_date = max_date-min_date
    format = ApplicationHelper::Entity.format
    #start_date_format = start_date.strftime format
    min_date_format=min_date.strftime format
    intermediary1_format=(min_date+diff_date/3).strftime format
    intermediary2_format=(min_date+diff_date*2/3).strftime format
    max_date_format =max_date.strftime format

    @time_labels = [min_date_format,intermediary1_format,intermediary2_format,max_date_format]
    @weight_labels=[@min_weight,@min_weight+(@diff/5),@min_weight+(2*@diff)/5,@min_weight+(3*@diff)/5,@min_weight+(4*@diff)/5,@max_weight]
    @weights_chart=Gchart.line :title=>"Weights evolution",
      :title_size => 30,
      :data=>@hacked_data,

      :size => '600x400' ,
      :line_colors => '76A4FB',
      :axis_with_labels => 'x,y,r',
      :axis_labels => [@time_labels,@weight_labels,@weight_labels]
  end


  # GET /weights/1/edit
  def edit
    @weight = Weight.find(params[:id])
    @user = User.find session[:user_id]
  end

  # POST /weights
  # POST /weights.xml
  def create
    @weight = Weight.new(params[:weight])
    @user = User.find session[:user_id]
    @weight.user=@user

    respond_to do |format|
      if @weight.save
        format.html { redirect_to(@weight, :notice => 'Weight was successfully created.') }
        format.xml  { render :xml => @weight, :status => :created, :location => @weight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weights/1
  # PUT /weights/1.xml
  def update
    @weight = Weight.find(params[:id])

    respond_to do |format|
      if @weight.update_attributes(params[:weight])
        format.html { redirect_to(@weight, :notice => 'Weight was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.xml
  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy

    respond_to do |format|
      format.html { redirect_to(weights_url) }
      format.xml  { head :ok }
    end
  end
end
