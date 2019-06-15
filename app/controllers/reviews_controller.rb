class ReviewsController < ApplicationController
  before_action :authorize

  def create
    @review.user = current_user
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to product_path(params[:product_id]), notice: "Review created!"
    else
      pp @review.errors
      redirect_to product_path(params[:product_id]), notice: "There was an error creating the comment: #{@review.errors.full_messages}"
    end
  end

  def destroy
    @product = Product.find (params[:product_id])
    @reviewed = Review.find (params[:id])
    @reviewed.destroy
    redirect_to @product, notice: 'Review was successfully deleted.'
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def new_review
    @review = Review.new(review_params)
  end


end