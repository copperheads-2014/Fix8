class JobsController < ApplicationController
  def new
    @job = Job.new
    @properties = Property.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
       redirect_to jobs_path
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
