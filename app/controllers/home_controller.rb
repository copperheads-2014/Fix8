class HomeController < ApplicationController
  before_action :set_user, :set_skills

  def index
    if contractor?
      @my_jobs = @user.jobs_i_bid_on
      # @open_jobs = Job.all - User.
      elsif landlord?
        @job = Job.new
        @properties = @user.properties
    end
    if landlord?
      lord_pending_jobs
      lord_completed_jobs
      my_properties
    end
  end

  private

  def set_user
    @user ||= User.find(session[:user_id])
  end

  def landlord?
    @user.user_type == 'landlord'
  end

  def contractor?
    @user.user_type == 'contractor'
  end

  def lord_completed_jobs
    @lord_completed_jobs = []
    @user.jobs.each do |job|
      @lord_completed_jobs << job if job.accepted_bid?
    end
  end

  def lord_pending_jobs
    @lord_pending_jobs = []
    @user.jobs.each do |job|
      @lord_pending_jobs << job unless job.accepted_bid?
    end
  end

  def set_skills
    @skills = Skill.all
  end

  def my_properties
    @properties = @user.properties
  end

end
