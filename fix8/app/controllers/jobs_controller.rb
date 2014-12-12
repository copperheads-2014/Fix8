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

end
