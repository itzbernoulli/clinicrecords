class FrontdeskController < ApplicationController
  before_action :authenticate_user!
	before_action :set_record, only: [:show, :edit, :update, :destroy]


  def index
  	@records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def new
  	@record = Record.new
  end

  def edit
  end

  def show
  end

  # def create
  #   @record = Record.new(record_params)
  #   set_user_and_time

  #   respond_to do |format|
  #     if @record.save
  #           format.html { redirect_to frontdesk_index_path, notice: 'Record was successfully created.' }
  #       # format.html { redirect_to @record, notice: 'Record was successfully created.' }
  #       # format.json { render :show, status: :created, location: @record }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @record.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  #  def update
  #   set_user_and_time
  #   respond_to do |format|
  #     if @record.update(record_params)
  #           format.html { redirect_to frontdesk_index_path, notice: 'Patient record was successfully created.' }
  #       # format.html { redirect_to @record, notice: 'Record was successfully updated.' }
  #       # format.json { render :show, status: :ok, location: @record }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @record.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def set_user_and_time
  #       @record.front_desk_name = current_user.fullname
  # end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end
end
