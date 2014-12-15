class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  before_action :set_skills, only: [:new, :create]
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if at_least_one_skill_selected? && @job.save
        add_job_skills
        format.html { redirect_to home_path, notice: 'Job was successfully created.' }
        format.json { render json: @job }
      else
        format.html {render :new }
        format.json { render json: @job.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def index
    @jobs = Job.all
  end

  def show
  end

  private
  def job_params
    params.require(:job).permit(:property_id, :description, :start_date, :end_date, :max_bid, :bid_length, :title)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_skills
    @skills = Skill.all
  end

  def add_job_skills
    @skills.each do |skill|
      @job.skills << skill if selected_skill?(skill.name)
    end
  end

  def selected_skill?(skill)
    params[:user_skill][skill] == "1"
  end

  def at_least_one_skill_selected?
    count = @skills.select {|skill| selected_skill?(skill.name)}.length
    return true if count > 0
    @job.errors.add(:description, "Error: At least one skill must be selected")
    false
  end

end
