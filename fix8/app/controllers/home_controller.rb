class HomeController < ApplicationController
  before_action :set_user

  def index
    if contractor?
      @my_jobs = @user.jobs_i_can_bid_on
      # @open_jobs = Job.all - User.
      elsif landlord?
        @job = Job.new
        @properties = @user.properties
    end
    if landlord?
      pending_jobs
      completed_jobs
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

  def completed_jobs
    @completed_jobs = []
    @user.jobs.each do |job|
      @completed_jobs << job if job.accepted_bid?
    end
  end

  def pending_jobs
    @pending_jobs = []
    @user.jobs.each do |job|
      @pending_jobs << job unless job.accepted_bid?
    end
  end

end
