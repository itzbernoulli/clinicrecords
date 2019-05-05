class DoctorsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_record, only: [:show, :edit, :update, :destroy]

  def index
  	@records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).where(nurse_updated: true).order(updated_at: :desc)
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
