class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  def new
    @job = Job.new
    @properties = @user.properties
  end

  def create
    @job = Job.new(job_params)

    #@job.property_id = params[:property_id]
    #@properties = Property.all
    if @job.save
      respond_to do |format| 
        format.html { redirect_to home_path, notice: 'Job was successfully created.' }
        format.json { render json: @job }
      end
       
    else
       respond_to do |format| 
        format.html {render :home_path}
        format.json { render json: @job.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def index
    @jobs = Job.all
  end

  def show
    @job
  end

  private
  def job_params
    params.require(:job).permit(:property_id, :description, :start_date, :end_date, :max_bid, :bid_length, :title)
  end

  def set_job
    @job = Job.find(params[:id])
  end


end
