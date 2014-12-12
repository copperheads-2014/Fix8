class JobsController < ApplicationController
  def new
    @job = Job.new
    @properties = Property.all
  end
end
