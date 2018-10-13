class PharmacistsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_record, only: [:show, :edit, :update, :destroy]

  def index
  	@records = Record.all
  end

  def new
  	@record = Record.new
  end

  def show
  end

  def edit
  end

  private
	# Use callbacks to share common setup or constraints between actions.
	def set_record
	  @record = Record.find(params[:id])
	end
end
