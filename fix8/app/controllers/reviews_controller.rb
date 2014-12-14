class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.bid_id = params[:bid_id]
    assign_to_user_type

    if @review.save
      redirect_to recipient_of_review
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def assign_to_user_type
    if @user.user_type == 'landlord'
      @review.review_for = 'contractor'
    else
      @review.review_for = 'landlord'
    end
  end

  def recipient_of_review
    bid = Bid.find(params[:bid_id])
    if @user.user_type == 'landlord'
      bid.contractor
    else
      bid.property.landlord
    end
  end

end
