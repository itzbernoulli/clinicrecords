class StaticController < ApplicationController
  before_action :set_category, only: [:merchants]
  before_action :set_merchant, only: [:merchant,:review]
	before_action :set_related_merchants, only: [:merchant,:review]

  def index
  	@categories = Category.all
    if params[:term]
      #Save search term
      Search.create(content: params[:term])
      @seventyplus = Merchant.where('instagram LIKE ?', "%#{params[:term]}%")
      puts "SEARCH RESULTS"
      # @coupon = Coupon.where('store LIKE ?', "%#{params[:store]}%")
    else
      @seventyplus = Merchant.first(10)
      puts "FIRST 10"
    end
  end

  def merchants
  	respond_to do |format|
        format.js
    end
  end

  def merchant
    @review = Review.new
  end

  def review
    @review = Review.new()

    @review.content = params["content"]
    # puts "CURRENT USER" + current_user.id.to_s
    @review.user_id = current_user.id
    @review.merchant_id = params["id"]

    respond_to do |format|
      if @review.save
        format.html { redirect_to "/static/" +@review.merchant_id.to_s+"/merchant#review", notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to "/static/" +@review.merchant_id.to_s+"/merchant#review", alert: 'Review was successfully created.' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end



  	private
    # Use callbacks to share common setup or constraints between actions.
	    def set_category
	      @selected = Category.find(params[:id])
	    end

      def set_merchant
        @merchant = Merchant.find(params[:id])
      end

      def set_related_merchants
        @related_merchants = Merchant.same_category(@merchant).all_except(@merchant)
      end
      # def review_params
      #   params.require(:content).permit(:content, :merchant_id, :user_id)
      # end
end
