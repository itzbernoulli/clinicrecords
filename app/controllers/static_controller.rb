class StaticController < ApplicationController
  before_action :set_category, only: [:merchants]
	before_action :set_merchant, only: [:merchant]

  def index
  	@categories = Category.all
    if params[:term]
      @seventyplus = Merchant.where('instagram LIKE ?', "%#{params[:store]}%")
      # @coupon = Coupon.where('store LIKE ?', "%#{params[:store]}%")
    else
      @seventyplus = Merchant.first(10)
    end
  end

  def merchants
  	respond_to do |format|
        format.js
    end
  end

  def merchant
    @related_merchants = Merchant.same_category(@merchant).all_except(@merchant)
  end



  	private
    # Use callbacks to share common setup or constraints between actions.
	    def set_category
	      @selected = Category.find(params[:id])
	    end

      def set_merchant
        @merchant = Merchant.find(params[:id])
      end
end
