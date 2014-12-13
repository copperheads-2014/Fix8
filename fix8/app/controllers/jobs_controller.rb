class JobsController < ApplicationController
  def new
    @job = Job.new
    @properties = @user.properties
  end

  def create
    @job = Job.new(job_params)

    #@job.property_id = params[:property_id]
    #@properties = Property.all
    if @job.save
       redirect_to home_path
    else
      render :new
    end
  end

  def index
    @jobs = Job.all
  end

  private
  def job_params
    params.require(:job).permit(:property_id, :description, :start_date, :end_date, :max_bid, :bid_length)
  end



end
