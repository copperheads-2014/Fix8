class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.contractor_id = @user.id
    @bid.job_id = params[:job_id]
    if @bid.save
      redirect_to home_path
    else
      render :new
    end
  end

  def accept
    if request.xhr?
      @bid = Bid.find(params[:id])
      @bid.accepted = true
      if @bid.save
        render json: {status: 'ok'}
      else
        render json: {status: 'fail'}
      end
    end
  end

  private
  def bid_params
    params.require(:bid).permit(:price, :comment)
  end

end
